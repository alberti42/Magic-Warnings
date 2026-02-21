import Foundation
import AppKit

// MARK: - Configuration

let kThreshold            = 20     // battery % below which to warn
let kSuppressionHours     = 6.0    // hours before repeating a warning for the same device
let kCheckInterval        = 600    // seconds between background checks (written into LaunchAgent plist)
let kBundleID             = "org.alberti42.magic-warnings"
let kLaunchAgentLabel     = "com.alberti42.magic-warnings-launcher"

// MARK: - Paths

let executableURL = URL(fileURLWithPath: CommandLine.arguments[0])
    .standardizedFileURL
    .resolvingSymlinksInPath()

let home           = FileManager.default.homeDirectoryForCurrentUser
let prefsURL       = home.appendingPathComponent("Library/Preferences/\(kBundleID).plist")
let launchAgentURL = home.appendingPathComponent("Library/LaunchAgents/\(kLaunchAgentLabel).plist")

// MARK: - Arguments

let isSilent = CommandLine.arguments.contains("--silent")

// MARK: - Entry Point

// Minimal delegate to suppress the default open-file panel that NSApplication
// shows when activated without a document-based setup.
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool { false }
}

if !isSilent {
    // Initialise NSApplication so we can show alerts.
    _ = NSApplication.shared
    let delegate = AppDelegate()
    NSApp.delegate = delegate
    NSApp.setActivationPolicy(.accessory)

    showManagementDialog()
    exit(0)
}

runBatteryCheck()

// MARK: - Battery Monitoring

func runBatteryCheck() {
    var timestamps = loadTimestamps()

    let output = run("/usr/sbin/ioreg",
                     args: ["-c", "AppleDeviceManagementHIDEventService", "-r", "-l"])

    var transport    = ""
    var product      = ""
    var serialNumber = ""

    for line in output.components(separatedBy: "\n") {

        // New device block — reset state.
        if line.contains("+-o") {
            transport    = ""
            product      = ""
            serialNumber = ""
            continue
        }

        if line.contains("\"Transport\"") {
            transport = extractValue(from: line)
        }

        // Only monitor Bluetooth devices; USB means the device is charging.
        guard transport == "Bluetooth" else { continue }

        if line.contains("\"Product\"") {
            product = extractValue(from: line)
        } else if line.contains("\"SerialNumber\"") {
            serialNumber = extractValue(from: line)
        } else if line.contains("\"BatteryPercent\""), !serialNumber.isEmpty {
            let raw = extractValue(from: line)
            guard let percent = Int(raw.filter(\.isNumber)) else { continue }

            if percent <= kThreshold && timestamps[serialNumber] == nil {
                sendNotification(title: "\(product) battery low",
                                 body:  "Battery status: \(percent)%")
                timestamps[serialNumber] = Date()
            }
        }
    }

    saveTimestamps(timestamps)
}

// MARK: - Timestamp Persistence

func loadTimestamps() -> [String: Date] {
    guard FileManager.default.fileExists(atPath: prefsURL.path),
          let data = try? Data(contentsOf: prefsURL),
          let obj  = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
          let dict = obj as? [String: Date]
    else { return [:] }

    // Drop entries that are older than the suppression window.
    let cutoff = Date().addingTimeInterval(-kSuppressionHours * 3600)
    return dict.filter { $0.value > cutoff }
}

func saveTimestamps(_ timestamps: [String: Date]) {
    guard let data = try? PropertyListSerialization.data(
        fromPropertyList: timestamps, format: .xml, options: 0
    ) else { return }
    try? data.write(to: prefsURL)
}

// MARK: - Notifications

func sendNotification(title: String, body: String) {
    // Route through osascript so the notification is attributed to the app bundle.
    let safeTitle = title.replacingOccurrences(of: "\"", with: "\\\"")
    let safeBody  = body.replacingOccurrences(of:  "\"", with: "\\\"")
    run("/usr/bin/osascript",
        args: ["-e", "display notification \"\(safeBody)\" with title \"\(safeTitle)\""])
}

// MARK: - LaunchAgent Management

func installLaunchAgent() {
    let plist: [String: Any] = [
        "Label":            kLaunchAgentLabel,
        "ProgramArguments": [executableURL.path, "--silent"],
        "StartInterval":    kCheckInterval,
        "RunAtLoad":        true,
        "LowPriorityIO":    true,
        "EnvironmentVariables": [
            "LANG": "en_US.UTF-8",
            "PATH": "/usr/bin:/bin:/usr/sbin:/sbin"
        ]
    ]
    guard let data = try? PropertyListSerialization.data(
        fromPropertyList: plist, format: .xml, options: 0
    ) else { return }

    let dir = launchAgentURL.deletingLastPathComponent()
    try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    try? data.write(to: launchAgentURL)

    let uid = String(getuid())
    run("/bin/launchctl", args: ["bootstrap", "gui/\(uid)", launchAgentURL.path])
    run("/bin/launchctl", args: ["kickstart", "-k", "gui/\(uid)/\(kLaunchAgentLabel)"])
}

func uninstallLaunchAgent() {
    let uid = String(getuid())
    run("/bin/launchctl", args: ["bootout", "gui/\(uid)/\(kLaunchAgentLabel)"])
    try? FileManager.default.removeItem(at: launchAgentURL)
}

/// Returns the executable path currently registered in the LaunchAgent plist, or nil if not installed.
func registeredExecutablePath() -> String? {
    guard let data = try? Data(contentsOf: launchAgentURL),
          let obj  = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
          let dict = obj as? [String: Any],
          let args = dict["ProgramArguments"] as? [String],
          let path = args.first
    else { return nil }
    return path
}

// MARK: - Management Dialog

func showManagementDialog() {
    let registeredPath  = registeredExecutablePath()
    let correctlyInstalled = (registeredPath == executableURL.path)
    let anyInstalled       = (registeredPath != nil)

    let statusText: String
    if correctlyInstalled {
        statusText = "installed"
    } else if anyInstalled {
        statusText = "installed (pointing to a different location)"
    } else {
        statusText = "not installed yet"
    }

    let alert = NSAlert()
    alert.messageText    = "Magic Warnings"
    alert.informativeText = "Launcher automatically executed every 10 minutes: \(statusText)."

    let installTitle = anyInstalled ? "Reinstall Launcher" : "Install Launcher"
    alert.addButton(withTitle: installTitle)       // button index 0
    alert.addButton(withTitle: "Uninstall Launcher") // button index 1
    alert.addButton(withTitle: "Quit")               // button index 2

    alert.buttons[0].isEnabled = !correctlyInstalled
    alert.buttons[1].isEnabled = anyInstalled

    switch alert.runModal() {
    case .alertFirstButtonReturn:   // Install / Reinstall
        if anyInstalled { uninstallLaunchAgent() }
        installLaunchAgent()
        sendNotification(title: "Magic Warnings",
                         body:  "Battery monitoring is now active. Checks run every 10 minutes.")
    case .alertSecondButtonReturn:  // Uninstall
        uninstallLaunchAgent()
        try? FileManager.default.removeItem(at: prefsURL)
        sendNotification(title: "Magic Warnings",
                         body:  "Battery monitoring has been disabled.")
    default:                        // Quit
        break
    }
}

// MARK: - Helpers

/// Run an executable with arguments, returning its standard output.
@discardableResult
func run(_ path: String, args: [String] = []) -> String {
    let task = Process()
    let pipe = Pipe()
    task.standardOutput = pipe
    task.standardError  = Pipe()
    task.executableURL  = URL(fileURLWithPath: path)
    task.arguments      = args
    try? task.run()
    task.waitUntilExit()
    return String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
}

/// Extract the value from an ioreg line of the form `  "Key" = "value"` or `  "Key" = 42`.
func extractValue(from line: String) -> String {
    guard let range = line.range(of: " = ") else { return "" }
    var value = String(line[range.upperBound...]).trimmingCharacters(in: .whitespaces)
    if value.hasPrefix("\"") { value = String(value.dropFirst()) }
    if value.hasSuffix("\"") { value = String(value.dropLast()) }
    return value
}

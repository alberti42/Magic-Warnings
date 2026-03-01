import Foundation
import AppKit
import UserNotifications

// MARK: - Configuration

let kThreshold            = 20     // battery % below which to warn
let kSuppressionHours     = 6.0    // hours before repeating a warning for the same device
let kCheckInterval        = 600    // seconds between background checks (written into LaunchAgent plist)
let kBundleID             = "io.alberti42.magic-warnings"
let kLaunchAgentLabel     = "io.alberti42.magic-warnings-launcher"

// MARK: - Paths

let executableURL = URL(fileURLWithPath: CommandLine.arguments[0])
    .standardizedFileURL
    .resolvingSymlinksInPath()

let home           = FileManager.default.homeDirectoryForCurrentUser
let prefsURL       = home.appendingPathComponent("Library/Preferences/\(kBundleID).plist")
let launchAgentURL = home.appendingPathComponent("Library/LaunchAgents/\(kLaunchAgentLabel).plist")

// MARK: - Arguments

let isSilent  = CommandLine.arguments.contains("--silent")
let isLogging = CommandLine.arguments.contains("--log")

func log(_ message: String) {
    guard isLogging else { return }
    print(message)
    fflush(stdout)
}

// MARK: - Entry Point

// Minimal delegate to suppress the default open-file panel that NSApplication
// shows when activated without a document-based setup.
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool { false }
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool { false }
}

// Stored at module level so ARC never releases it while NSApp holds only a weak reference.
let appDelegate = AppDelegate()

if !isSilent {
    // Assign the delegate before the run loop starts so that finishLaunching
    // cannot call applicationShouldOpenUntitledFile with no delegate in place.
    _ = NSApplication.shared
    NSApp.delegate = appDelegate
    NSApp.setActivationPolicy(.accessory)

    showManagementDialog()
    exit(0)
}

runBatteryCheck()

// MARK: - Battery Monitoring

func runBatteryCheck() {
    log("=== Magic Warnings battery check started ===")
    var timestamps = loadTimestamps()

    log("Running: /usr/sbin/ioreg -c AppleDeviceManagementHIDEventService -r -l")
    let output = run("/usr/sbin/ioreg",
                     args: ["-c", "AppleDeviceManagementHIDEventService", "-r", "-l"])

    if output.isEmpty {
        log("WARNING: ioreg returned empty output")
    }

    var transport    = ""
    var product      = ""
    var serialNumber = ""
    var deviceCount  = 0

    for line in output.components(separatedBy: "\n") {

        // New device block — reset state.
        if line.contains("+-o") {
            transport    = ""
            product      = ""
            serialNumber = ""
            deviceCount += 1
            continue
        }

        // Collect all four fields unconditionally — ioreg lists properties
        // alphabetically, so BatteryPercent/Product/SerialNumber appear
        // before Transport and must be captured before the Bluetooth check.
        if line.contains("\"Transport\"") {
            transport = extractValue(from: line)
            log("Device #\(deviceCount): Transport = \"\(transport)\"")
        } else if line.contains("\"Product\"") {
            product = extractValue(from: line)
            log("Device #\(deviceCount): Product = \"\(product)\"")
        } else if line.contains("\"SerialNumber\"") {
            serialNumber = extractValue(from: line)
            log("Device #\(deviceCount): SerialNumber = \"\(serialNumber)\"")
        } else if line.contains("\"BatteryPercent\"") {
            let raw = extractValue(from: line)
            guard let percent = Int(raw.filter(\.isNumber)) else {
                log("Device #\(deviceCount): BatteryPercent: could not parse value \"\(raw)\"")
                continue
            }
            log("Device #\(deviceCount): BatteryPercent = \(percent)%")

            // Only act on Bluetooth devices; USB means the device is charging.
            guard transport == "Bluetooth" else {
                log("  → skipped (Transport = \"\(transport)\", not Bluetooth)")
                continue
            }
            guard !serialNumber.isEmpty else {
                log("  → skipped (no SerialNumber)")
                continue
            }

            if percent <= kThreshold {
                if let lastSent = timestamps[serialNumber] {
                    let hours = Date().timeIntervalSince(lastSent) / 3600
                    log("  → below threshold (\(kThreshold)%), but notification suppressed (last sent \(String(format: "%.1f", hours))h ago, suppression window \(kSuppressionHours)h)")
                } else {
                    log("  → below threshold (\(kThreshold)%), sending notification")
                    sendNotification(title: "\(product) battery low",
                                     body:  "Battery status: \(percent)%")
                    timestamps[serialNumber] = Date()
                }
            } else {
                log("  → OK (above threshold \(kThreshold)%)")
            }
        }
    }

    log("=== Check complete ===")
    saveTimestamps(timestamps)
}

// MARK: - Timestamp Persistence

func loadTimestamps() -> [String: Date] {
    log("Loading timestamps from: \(prefsURL.path)")
    guard FileManager.default.fileExists(atPath: prefsURL.path) else {
        log("  Prefs file not found — no suppression records")
        return [:]
    }
    guard let data = try? Data(contentsOf: prefsURL),
          let obj  = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
          let dict = obj as? [String: Date]
    else {
        log("  WARNING: failed to read/parse prefs file")
        return [:]
    }

    // Drop entries that are older than the suppression window.
    let cutoff = Date().addingTimeInterval(-kSuppressionHours * 3600)
    let filtered = dict.filter { $0.value > cutoff }
    for (serial, date) in filtered {
        let hours = Date().timeIntervalSince(date) / 3600
        log("  Suppressed serial \(serial) (notified \(String(format: "%.1f", hours))h ago)")
    }
    return filtered
}

func saveTimestamps(_ timestamps: [String: Date]) {
    guard let data = try? PropertyListSerialization.data(
        fromPropertyList: timestamps, format: .xml, options: 0
    ) else { return }
    try? data.write(to: prefsURL)
}

// MARK: - Notifications

func sendNotification(title: String, body: String) {
    log("  Sending notification: \"\(title)\" — \"\(body)\"")
    // UNUserNotificationCenter attributes the notification to the app bundle,
    // so the app icon is shown instead of the Script Editor icon.
    let center  = UNUserNotificationCenter.current()
    let sema    = DispatchSemaphore(value: 0)

    center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
        if !granted { log("  WARNING: notification permission not granted") }
        guard granted else { sema.signal(); return }
        let content   = UNMutableNotificationContent()
        content.title = title
        content.body  = body
        center.add(UNNotificationRequest(identifier: UUID().uuidString,
                                         content: content, trigger: nil)) { _ in
            sema.signal()
        }
    }
    sema.wait()
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
    let registeredPath = registeredExecutablePath()

    // If the launcher exists but points to a stale path (app was moved), remove it silently.
    if let path = registeredPath, path != executableURL.path {
        uninstallLaunchAgent()
    }

    let correctlyInstalled = (registeredPath == executableURL.path)

    let statusText = correctlyInstalled ? "installed" : "not installed yet"

    let alert = NSAlert()
    alert.messageText    = "Magic Warnings"
    alert.informativeText = "Launcher automatically executed every 10 minutes: \(statusText)."

    alert.addButton(withTitle: "Install Launcher")   // button index 0
    alert.addButton(withTitle: "Uninstall Launcher") // button index 1
    alert.addButton(withTitle: "Quit")               // button index 2

    alert.buttons[0].isEnabled = !correctlyInstalled
    alert.buttons[1].isEnabled = correctlyInstalled

    switch alert.runModal() {
    case .alertFirstButtonReturn:   // Install
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

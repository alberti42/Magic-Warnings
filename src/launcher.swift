import Foundation

// Swift launcher replacing the standard AppleScript `applet` binary.
// Runs main.scpt via NSAppleScript with no modifier-key detection,
// no startup screen, and no Run/Stop dialog.

let executableURL = URL(fileURLWithPath: CommandLine.arguments[0])
    .standardizedFileURL
    .resolvingSymlinksInPath()

// Executable: .../Magic Warnings.app/Contents/MacOS/applet
// Script:     .../Magic Warnings.app/Contents/Resources/Scripts/main.scpt
let scriptURL = executableURL
    .deletingLastPathComponent()    // → Contents/MacOS/
    .deletingLastPathComponent()    // → Contents/
    .appendingPathComponent("Resources/Scripts/main.scpt")

var loadError: NSDictionary?
guard let script = NSAppleScript(contentsOf: scriptURL, error: &loadError) else {
    fputs("Magic Warnings: failed to load '\(scriptURL.path)': \(loadError ?? [:])\n", stderr)
    exit(1)
}

var execError: NSDictionary?
script.executeAndReturnError(&execError)

if let error = execError {
    let msg = (error[NSAppleScript.errorMessage] as? String) ?? String(describing: error)
    fputs("Magic Warnings: \(msg)\n", stderr)
    exit(1)
}

# Magic Warnings app for macOS

## Description

**Magic Warnings** is a lightweight macOS app that monitors the battery levels of your Apple Magic Mouse, Trackpad, and Keyboard and sends a notification when any device drops below 20%.

[<img src="./Graphics/low_battery_graphics.svg" height=64 alt="Magic Warnings Logo"/>](https://github.com/alberti42/Magic-Warnings/)

**Key features:**

- Monitors multiple Apple Magic devices simultaneously.
- Sends a system notification when any device battery drops below 20%.
- Checks battery levels automatically every 10 minutes.
- Repeats the warning every 6 hours if the battery remains low.

---

## Installation

1. Download the latest `.zip` from the [Releases](https://github.com/alberti42/Magic-Warnings/releases) page, extract it, and move `Magic Warnings.app` to your `/Applications` folder.

2. Remove the macOS quarantine flag:
   ```bash
   xattr -d com.apple.quarantine /Applications/Magic\ Warnings.app
   ```

3. Launch the app. On first launch it automatically installs a background agent that runs every 10 minutes — no extra steps needed.

4. When prompted, enable notifications for **Magic Warnings** in System Settings → Notifications:

   <img src="./Graphics/messages_authorization.jpg" alt="Notifications settings" style="width:400px;"/>

5. *(Optional)* Allow notifications in Focus modes:

   <img src="./Graphics/focus_configuration.jpg" width=512 alt="Focus mode configuration"/>

---

## Uninstallation

To remove the background agent before deleting the app, hold **Option (⌥)** and launch `Magic Warnings.app`. A dialog will appear with the option to uninstall the launcher.

After uninstalling the launcher you can move `Magic Warnings.app` to the Trash as usual.

---

## Donations

If you find **Magic Warnings** useful, consider buying me a coffee!

[<img src="./Graphics/buy_me_coffee.png" alt="Buy Me a Coffee" width=200/>](https://buymeacoffee.com/alberti)

---

## Author

- **Author:** Andrea Alberti
- **GitHub:** [alberti42](https://github.com/alberti42)
- **Donations:** [![Buy Me a Coffee](https://img.shields.io/badge/Donate-Buy%20Me%20a%20Coffee-orange)](https://buymeacoffee.com/alberti)

Feel free to open issues or contribute in the [GitHub repository](https://github.com/alberti42/Magic-Warnings/issues).

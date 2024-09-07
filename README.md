# Magic Warning

Use this graphics as a logo for the page 

![Logo](./Graphics/low_battery_graphics.svg)
<img height=48 src="./Graphics/low_battery_graphics.svg">

## Description

The app will show a warning if the battery level of Apple Magic mouse, trackpad, and keyboard drops below 20%.

## Manual installation

- step1 
- step2
- Use the icon `Graphics/low_battery_graphics.icns`

## Installation from releases

-

## Periodic monitoring

- Download `org.alberti42.magic-warning-launcher.plist` in `<HOME>/Library/LaunchAgents`.
- Modify `ProgramArguments` to reflect the actual location where you install the `Magic Warning` app.
	```
	<key>ProgramArguments</key>
		<array>
			<string>/Applications/Magic Warnings.app/Contents/MacOS/applet</string>
		</array>
	```

## Donations

I would be grateful for any donation to support the development of this plugin.

[<img src="docs/images/buy_me_coffee.png" width=300 alt="Buy Me a Coffee QR Code"/>](https://buymeacoffee.com/alberti)

## Author

- **Author:** Andrea Alberti
- **GitHub Profile:** [alberti42](https://github.com/alberti42)
- **Donations:** [![Buy Me a Coffee](https://img.shields.io/badge/Donate-Buy%20Me%20a%20Coffee-orange)](https://buymeacoffee.com/alberti)

Feel free to contribute to the development of this plugin or report any issues in the [GitHub repository](https://github.com/alberti42/obsidian-plugins-annotations/issues).

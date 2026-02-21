SRC        := src
APP        := Magic Warnings.app
APPLET_DIR := $(APP)/Contents/MacOS
APPLET     := $(APPLET_DIR)/applet
SCRIPT     := $(APP)/Contents/Resources/Scripts/main.scpt

LAUNCH_AGENT_LABEL := com.alberti42.magic-warnings-launcher
LAUNCH_AGENTS_DIR  := $(HOME)/Library/LaunchAgents
PLIST_SRC          := $(LAUNCH_AGENT_LABEL).plist
PLIST_DEST         := $(LAUNCH_AGENTS_DIR)/$(LAUNCH_AGENT_LABEL).plist

INSTALL_DIR := /Applications

DEV_ID := Developer ID Application: Andrea Alberti (9V3X7C8VCK)

PLIST := $(APP)/Contents/Info.plist

.PHONY: all build swift applescript sign install install-agent uninstall-agent version

all: build sign

build: swift applescript

swift:
	mkdir -p "$(APPLET_DIR)"
	swiftc "$(SRC)/launcher.swift" -o "$(APPLET)"

applescript:
	osacompile -o "$(SCRIPT)" "$(SRC)/main.applescript"

sign:
	codesign --force --deep --sign "$(DEV_ID)" --options runtime --timestamp "$(APP)"

install: build sign
	cp -R "$(APP)" "$(INSTALL_DIR)/"

install-agent:
	cp "$(PLIST_SRC)" "$(PLIST_DEST)"
	launchctl load "$(PLIST_DEST)"

uninstall-agent:
	launchctl unload "$(PLIST_DEST)"
	rm -f "$(PLIST_DEST)"

version:
	@TAG=$$(git describe --tags --abbrev=0 2>/dev/null); \
	[ -n "$$TAG" ] || { echo "Error: no git tags found"; exit 1; }; \
	VERSION=$${TAG#v}; \
	/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $$VERSION" "$(PLIST)"; \
	touch "release-notes/$$TAG.md"; \
	echo "Version set to $$VERSION"; \
	echo "Edit release-notes/$$TAG.md before pushing the tag"

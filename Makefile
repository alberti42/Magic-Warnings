SRC    := src
APP    := Magic Warnings.app
APPLET := $(APP)/Contents/MacOS/applet
SCRIPT := $(APP)/Contents/Resources/Scripts/main.scpt

LAUNCH_AGENT_LABEL := com.alberti42.magic-warnings-launcher
LAUNCH_AGENTS_DIR  := $(HOME)/Library/LaunchAgents
PLIST_SRC          := $(LAUNCH_AGENT_LABEL).plist
PLIST_DEST         := $(LAUNCH_AGENTS_DIR)/$(LAUNCH_AGENT_LABEL).plist

INSTALL_DIR := /Applications

DEV_ID := Developer ID Application: Andrea Alberti (9V3X7C8VCK)

.PHONY: all build swift applescript sign install install-agent uninstall-agent

all: build sign

build: swift applescript

swift:
	swiftc "$(SRC)/launcher.swift" -o "$(APPLET)"

applescript:
	osacompile -o "$(SCRIPT)" "$(SRC)/main.applescript"

sign:
	codesign --force --deep --options runtime --sign "$(DEV_ID)" "$(APP)"

install: build sign
	cp -R "$(APP)" "$(INSTALL_DIR)/"

install-agent:
	cp "$(PLIST_SRC)" "$(PLIST_DEST)"
	launchctl load "$(PLIST_DEST)"

uninstall-agent:
	launchctl unload "$(PLIST_DEST)"
	rm -f "$(PLIST_DEST)"

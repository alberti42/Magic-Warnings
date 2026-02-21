-include .env

SRC        := src
APP        := Magic Warnings.app
APPLET_DIR := $(APP)/Contents/MacOS
APPLET     := $(APPLET_DIR)/applet

LAUNCH_AGENT_LABEL := io.alberti42.magic-warnings-launcher
LAUNCH_AGENTS_DIR  := $(HOME)/Library/LaunchAgents
PLIST_SRC          := $(LAUNCH_AGENT_LABEL).plist
PLIST_DEST         := $(LAUNCH_AGENTS_DIR)/$(LAUNCH_AGENT_LABEL).plist

INSTALL_DIR := /Applications

TEAM_ID        := 9V3X7C8VCK
DEV_ID         := Developer ID Application: Andrea Alberti ($(TEAM_ID))
NOTARY_PROFILE ?= notary-profile

PLIST   := $(APP)/Contents/Info.plist
VERSION := $(shell /usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$(PLIST)" 2>/dev/null)
ZIP     := Magic-Warnings-$(VERSION).zip

.PHONY: all build swift sign notarize verify install install-agent uninstall-agent version release

all: build sign

build: swift

swift:
	mkdir -p "$(APPLET_DIR)"
	swiftc -target arm64-apple-macosx11.0   "$(SRC)/launcher.swift" -o "$(APPLET)-arm64"
	swiftc -target x86_64-apple-macosx10.14 "$(SRC)/launcher.swift" -o "$(APPLET)-x86_64"
	lipo -create -output "$(APPLET)" "$(APPLET)-arm64" "$(APPLET)-x86_64"
	rm "$(APPLET)-arm64" "$(APPLET)-x86_64"

sign:
	$(eval TMPDIR := $(shell mktemp -d))
	cp -R "$(APP)" "$(TMPDIR)/"
	xattr -cr "$(TMPDIR)/$(APP)"
	codesign --force --deep --sign "$(DEV_ID)" --options runtime --timestamp "$(TMPDIR)/$(APP)"
	cp -R "$(TMPDIR)/$(APP)/." "$(APP)"
	rm -rf "$(TMPDIR)"

notarize:
	ditto -c -k --keepParent "$(APP)" "$(ZIP)"
	xcrun notarytool submit "$(ZIP)" \
	  --keychain-profile "$(NOTARY_PROFILE)" \
	  --wait
	xcrun stapler staple "$(APP)"
	ditto -c -k --keepParent "$(APP)" "$(ZIP)"
	$(MAKE) verify

verify:
	xcrun stapler validate "$(APP)"
	spctl --assess -vv "$(APP)"

install: build sign
	cp -R "$(APP)" "$(INSTALL_DIR)/"

install-agent:
	cp "$(PLIST_SRC)" "$(PLIST_DEST)"
	launchctl bootstrap gui/$$(id -u) "$(PLIST_DEST)"
	launchctl kickstart -k gui/$$(id -u)/$(LAUNCH_AGENT_LABEL)

uninstall-agent:
	launchctl bootout gui/$$(id -u)/$(LAUNCH_AGENT_LABEL)
	rm -f "$(PLIST_DEST)"

release:
	@TAG=$$(git describe --tags --abbrev=0 2>/dev/null); \
	[ -n "$$TAG" ] || { echo "Error: no git tags found"; exit 1; }; \
	printf "Promote pre-release $$TAG to full release? [y/N] "; \
	read CONFIRM; \
	[ "$$CONFIRM" = "y" ] || { echo "Aborted."; exit 1; }; \
	gh release edit "$$TAG" --prerelease=false --draft=false --latest; \
	echo "$$TAG is now the latest release."

version:
	@TAG=$$(git describe --tags --abbrev=0 2>/dev/null); \
	[ -n "$$TAG" ] || { echo "Error: no git tags found"; exit 1; }; \
	VERSION=$${TAG#v}; \
	/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $$VERSION" "$(PLIST)"; \
	touch "release-notes/$$TAG.md"; \
	echo "Version set to $$VERSION"; \
	echo "Edit release-notes/$$TAG.md before pushing the tag"

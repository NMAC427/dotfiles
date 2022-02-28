#!/bin/bash
# Configure iTerm2 to load preferences from dotfile

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string ~/.config/iterm2/preferences &&
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true &&
    defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection -integer 2

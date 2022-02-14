#!/usr/bin/env zsh
# Set root config directory for zsh
export ZDOTDIR=~/.config/zsh

# Load .zshenv in ZDOTDIR (if it exists)
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
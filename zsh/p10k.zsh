# If terminal is iTerm -> use icons
# else use a different theme with higher compatibility
if [[ $TERM_PROGRAM == *"iTerm"* ]]; then
	source $ZDOTDIR/p10k_default.zsh
else
	source $ZDOTDIR/p10k_ascii.zsh
fi

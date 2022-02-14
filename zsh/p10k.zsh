# If not using SSH or terminal is iTerm -> use icons
# else use a different theme with higher compatibility
if [[ -z $SSH_CONNECTION || $LC_TERMINAL == "iTerm"* ]]; then
	source $ZDOTDIR/config/p10k/p10k_icons.zsh
else
	source $ZDOTDIR/config/p10k/p10k_simple.zsh
fi

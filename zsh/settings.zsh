# User Settings #
#################

export CLICOLOR=1
export EDITOR=nvim

# Source custom configs
source $ZDOTDIR/aliases.zsh
find -L $ZDOTDIR/config -type f -name '*.zsh' -print0 | sort -z |
while IFS= read -r -d $'\0' line; do
	source "$line"
done

# iTerm2 #
##########

test -e "${HOME}/.iterm2_shell_integration.zsh" && \
	source "${HOME}/.iterm2_shell_integration.zsh"

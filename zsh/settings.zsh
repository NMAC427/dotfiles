# User Settings #
#################

export DOTFILES_PATH="${0:A:h:h}"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export CLICOLOR=1
export EDITOR=nvim

export BAT_PAGER="less -RF"  # Enable scroll wheel support in bat
export LANG="en_US.UTF-8"

# ZSH options
## History
HISTFILE="$XDG_CACHE_HOME/zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

## Various
setopt AUTO_CD
setopt CORRECT
setopt INTERACTIVE_COMMENTS

## Styling
export SPROMPT="Correct %F{red}%R%f to %F{green}%r%f? [Yes, No, Abort, Edit] "  # Auto-correct prompt
zstyle ":completion:*" menu select


# Source custom configs #
# #######################

source $ZDOTDIR/aliases.zsh
find -L $ZDOTDIR/config -type f -name '*.zsh' -print0 | sort -z |
while IFS= read -r -d $'\0' line; do
	source "$line"
done

# Hooks
eval "$(direnv hook zsh)"


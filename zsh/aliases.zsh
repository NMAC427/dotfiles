alias source_zsh="source $ZDOTDIR/.zshrc"
alias dotfiles_install="$DOTFILES_PATH/install"

alias vi="nvim"
reveal() { open -R "${1:-.}"; }

# LS Aliases
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias ldot='ls -ld .*'
alias lsr='ls -lARFh' #Recursive list of files and directories

# Copy path to clipboard
alias copydir='pwd | pbcopy'

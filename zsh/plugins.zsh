#### Set up Zi ####
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
#### DONE ####

# Install Plugins
zi ice lucid atinit'ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay;'
zi light z-shell/F-Sy-H

zi ice lucid atload'_zsh_autosuggest_start;'
zi light zsh-users/zsh-autosuggestions

zi ice lucid pick'/dev/null'
zi light zsh-users/zsh-completions

zi ice lucid depth=1 atinit'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' atload'[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' nocd
zi light romkatv/powerlevel10k

zi ice wait lucid depth"1"
zi light agkozak/zsh-z


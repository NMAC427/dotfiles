#### Set up Zi ####
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
#### DONE ####

# Install meta plugins
zi light-mode for z-shell/z-a-meta-plugins \
	@zsh-users+fast @romkatv

# Z
zi ice wait lucid depth"1"
zi light agkozak/zsh-z
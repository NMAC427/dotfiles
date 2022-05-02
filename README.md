# Dotfiles

**Work in progress...**

Dotfiles uses [Dotbot](dotbot) for installation.

## Quick Setup
- Clone this repository.
- Review [install.conf.yaml](install.conf.yaml)
- Run [./install](install) to automatically set up the development environment.

```sh
git clone https://github.com/NMAC427/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Note that the install script is idempotent: it can safely be run multiple times.

## Making Local Customizations

You can make local customizations for some programs by editing these files:

- `zsh` : `~/.zshrc_local_before` runs before `.zshrc`
- `zsh` : `~/.zshrc_local_after` runs after `.zshrc`
- `git` : `~/.gitconfig_local`

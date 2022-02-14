# Set install dir
if [[ $OSTYPE == linux-* ]]; then
  export FZF_PREFIX=/opt
elif [[ $OSTYPE == darwin* ]]; then
  export FZF_PREFIX=/usr/local/opt
else
  # FZF not available
  return 0
fi

# use spectrum_ls to list all ansi colors
# https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:230,fg+:193,bg+:233,hl+:231
  --color info:150,prompt:110,spinner:150,pointer:167,marker:174
'

if command -v fd > /dev/null; then
  local FD_DEFAULT='fd --strip-cwd-prefix --exclude ".git"'
  export FZF_DEFAULT_COMMAND="(git ls-tree -r --name-only HEAD || ${FD_DEFAULT} --type f --hidden) 2> /dev/null"
else
  export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'
  echo "[FZF Module]: 'fd' not found, falling back to 'find' (no hidden files)"
fi

# Set FZF fzf-file-widget to use the same options
# Other available overrides:
# fzf-file-widget: FZF_CTRL_T_COMMAND, FZF_CTRL_T_OPTS
# fzf-cd-widget: FZF_ALT_C_COMMAND, FZF_ALT_C_OPTS
# fzf-history-widget: FZF_CTRL_R_OPTS
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Auto-completion
[[ $- == *i* ]] && source "$FZF_PREFIX/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "$FZF_PREFIX/fzf/shell/key-bindings.zsh"


# __cmd_file <file> <command>
__cmd_file() {
  [ ! -n "$1" ] && echo "no results found" && return -1
  [ -f "$1" ] && ${2} "$1"
  [ -d "$1" ] && echo "Result is a directory, running cd" && cd "$1"
}

TREE_PREVIEW='tree -C -L 2 --noreport --filelimit 256 --dirsfirst'


# does global file search, shows selected file in bat
fbatg() {
    local file=$(locate -i "${*:-/}" | fzf --query="$*" --select-1 --exit-0)
    __cmd_file "$file" "bat"
}

# does local file search, from current directory, displays file in bat
fbatl() {
    local file=$(fzf --query="$*" --select-1 --exit-0)
    __cmd_file "$file" "bat"
}


# global file search -> editor
# Vim FZF Global
vfg() {
  local file="$(locate -i "${*:-/}" | fzf --query="$*" --select-1 --exit-0)";
  __cmd_file "$file" "$EDITOR"
}

# Pick file to edit
# Vim FZF Local
vfl() {
  local file=$(fzf --exact --height 40% --reverse --query="$*"  --select-1 --exit-0)
  __cmd_file "$file" "$EDITOR"
}


# Search through all files with ag, then open file at location
# Vim FZF Content
vfc(){
  if [ !  "$*" ]; then
    echo "Usage: $0 search_term"
    return 1
  fi
# rg -n --no-ignore-vcs --no-messages --glob "*$1" "${@:2}"
  local file_line=$(ag -U $* | fzf --select-1 | cut -d':' -f -2)
  local file=$(echo $file_line | cut -d':' -f1)
  local line=$(echo $file_line | cut -d':' -f2)
  [ -n "$file_line" ] && ${=EDITOR} "$file" +$line
}


# Navigation functions from https://github.com/nikitavoloboev/dotfiles/blob/master/zsh/functions/fzf-functions.zsh#L1
# fcdg <dir> - Search dirs and cd to them
fcd() {
  local dir
  dir=$(
    ${=FD_DEFAULT} --type directory |
    fzf --no-multi --query="$*" --preview="$TREE_PREVIEW {}"
  ) &&
  cd "$dir"
}

# fcd <dir> - Search dirs and cd to them (included hidden dirs)
fcdh() {
  local dir
  dir=$(
    ${=FD_DEFAULT} --type directory --hidden --no-ignore |
    fzf --no-multi --query="$*" --preview="$TREE_PREVIEW {}"
  ) && 
  cd "$dir"
}

# FZF version of the z command; cd into most frequent dir
fz() {
  local file
  file=$(
    z -l 2>&1 |
    sed 's/^[0-9,.]* *//' |
    fzf --query="$*" --height 40% +s +m --tac --preview="$TREE_PREVIEW {}"
  ) &&
  
  cd "$file" && ls
}

# global:  cd into the directory of the selected file
# FZF file cd global
ffcdg() {
  local file
  local dir
  file=$(
    locate -i "${*:-/}" |
    fzf +m -q "$*" --preview="$TREE_PREVIEW \"\$(dirname {})\""
  ) && dir=$(dirname "$file") && cd "$dir"
  ls
}

# FZF file cd
ffcd() {
  local file
  local dir
  file=$(
    fzf +m -q "$*" --preview="$TREE_PREVIEW \"\$(dirname {})\""
  ) && dir=$(dirname "$file") && cd "$dir"
  ls
}


# Search env variables
fenv() {
  local out
  out=$(env | fzf)
  echo $(echo $out)
}


cd..(){
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs "$(dirname "$1")"
    fi
  }
  local DIR=$(get_parent_dirs "$(realpath "${1:-$PWD}")" | fzf-tmux --tac)
  cd "$DIR"
}

# search source code, then pipe files with 10 line buffer into fzf preview using bat.
# requirements:
# - fzf: https://github.com/junegunn/fzf
# - ag: https://github.com/ggreer/the_silver_searcher
# - bat: https://github.com/sharkdp/bat
# Notes:
#  - if you want to replace ag for rg feel free (https://blog.burntsushi.net/ripgrep/)
#  - Same goes for bat, although ccat and others are definitely worse
#  - the $ext extraction uses a ZSH specific text globber
s(){
  local margin=7 # number of lines above and below search result.
  local preview_cmd='search={};file=$(echo $search | cut -d':' -f 1 );'
  preview_cmd+="margin=$margin;" # Inject value into scope.
  preview_cmd+='line=$(echo $search | cut -d':' -f 2 );'
  preview_cmd+='tail -n +$(( $(( $line - $margin )) > 0 ? $(($line-$margin)) : 0)) $file | head -n $(($margin*2+1)) |'
  preview_cmd+='bat --paging=never --color=always --style=plain --file-name $file --highlight-line $(($margin+1>$line ? $line : $margin+1))'
  local full=$(rg -n --no-messages "$*" \
    | fzf --select-1 --exit-0 \
          --preview-window up:$(($margin*2+1)) --height=100%  --preview $preview_cmd)
  local file="$(echo $full | awk -F: '{print $1}')"
  local line="$(echo $full | awk -F: '{print $2}')"
  [ -n "$file" ] && $EDITOR "$file" +$line
}

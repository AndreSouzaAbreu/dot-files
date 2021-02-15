

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## ENV VARS
export HISTSIZE=25000
export HISTFILESIZE=25000
export EDITOR=vim
export BROWSER=brave
export PATH=$PATH:$HOME/.local/bin
export LANG=C
export shell=${SHELL##*/}

## CLEAN UP HOME DIR
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
# export XINITRC="${XDG_CONFIG_HOME}/x11/xinitrc"
export LESSHISTFILE="-"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
# export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

## ALIASES
[ -f ~/.profile_aliases ] && source ~/.profile_aliases

## ZOXIDE
[ -f /usr/bin/zoxide ] &&  eval "$(zoxide init $shell)"

## FZF
fzf_dir="$HOME/.local/share/fzf"
if [[ -d $fzf_dir ]]; then
  export PATH=$PATH:$fzf_dir/bin
  source "$fzf_dir/shell/completion.$shell" 
  source "$fzf_dir/shell/key-bindings.$shell"
fi

## custom prompt
PS1='\[\033[00;32m\]\u \[\033[00;37m\][\w] '

## utility to add, edit, view, or sync aliases
function aliases() {
  case "$1" in
    edit) $EDITOR ~/.profile_aliases ;;
    sync) source ~/.profile_aliases ;;
    add)
      shift
      name=$1
      shift
      echo "alias $name='$@'" >> ~/.profile_aliases
      ;;
    rm)
      name=$1
      sed -i "alias $1/d"  ~/.profile_aliases 
      ;;
    *) alias ;;
  esac
}

## utility to edit, view, or sync profile
function profile() {
  case "$1" in
    edit) $EDITOR ~/.profile ;;
    sync) source ~/.profile ;;
    *) cat ~/.profile ;;
  esac
  return 0
}

## Go back to the parent directory n times
function up() {
  number="${1:-1}"
  for i in $(seq $number); do
    cd ..
  done
  return 0
}

## Make a directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$1"
  return 0
}

## Run a command n times
function repeat() {
  number="${1:-1}"
  shift
  command=$@
  for i in $(seq $number); do
    $command
  done
  return 0
}

## append new line to the output of perl-lorem command
function lorem() {
  /usr/bin/vendor_perl/lorem $@ && echo
}

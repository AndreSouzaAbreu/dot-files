
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

## ALIASES
[ -f ~/.profile_aliases ] && source ~/.profile_aliases

## ZOXIDE
[ -f /usr/bin/zoxide ] &&  eval "$(zoxide init $shell)"

## FZF
if [[ -d ~/.fzf ]]; then
  if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
    export PATH="${PATH}:${HOME}/.fzf/bin"
  fi
  source "$HOME/.fzf/shell/completion.$shell" 
  source "$HOME/.fzf/shell/key-bindings.$shell"
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

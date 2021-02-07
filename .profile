
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

## custom shell prompt (works with bash, sh)
function customprompt() {
  # the current number of lines in bash history:
  history_size=$(fc -l -1)

  # history_size=$(wc -l ~/.bash_history)
  history_size=${history_size%%[^0-9]*}

  # set an initial value to the number of lines
  # in bash history stored from the last time
  # this function was executed. This avoids bugs
  # when running the first command in the current
  # shell session

  if [ -z "$history_lastsize" ]; then
    history_lastsize=0
  fi

  # if the current number of lines in bash history
  # is different from the last number of lines, then
  # we print the user name and the current directory.
  # otherwise, we just print >>
  if [[ $history_size -eq $history_lastsize ]]; then
    PS1='$ '
  else
    PS1='\[\033[01;32m\]\u \[\033[00m\]`pwd`:\n$ '
  fi

  # update the last value to the current value
  history_lastsize=${history_size}
}

PROMPT_COMMAND=customprompt

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

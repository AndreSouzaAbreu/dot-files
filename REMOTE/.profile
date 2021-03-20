# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# fix issue with unknown terminals via ssh
export TERM=linux

# don't put duplicate lines in the history.
# and force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# more settings for history
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# disable less hist file
LESSHISTFILE=-

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# aliases
alias v='vim'
alias l='ls'
alias q='exit'

# files
alias la='LC_ALL=C ls -lh --human-readable --group-directories-first -A'
alias lh='LC_ALL=C ls -lh --human-readable --group-directories-first'
alias l1='LC_ALL=C ls -1'

# git
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline'

# docker-compose
alias ddown='docker-compose down'
alias dup='docker-compose up -d'

# docker
alias dk='docker'
alias dkei='docker exec -it'
alias dkeir='docker exec -it --user root'
alias dkps='docker ps --format "{{.Names}} {{.Image}}"'

## functions

# Go back to the parent directory n times
function up() {
  number="${1:-1}"
  for i in $(seq $number); do
    cd ..
  done
  return 0
}

# Run a command n times
function repeat() {
  number="${1:-1}"
  shift
  command=$@
  for i in $(seq $number); do
    $command
  done
  return 0
}

# Make a directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$1"
  return 0
}

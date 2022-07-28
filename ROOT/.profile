# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# fix issue with unknown terminals via ssh
export TERM=xterm

# programs
export EDITOR=vim
export VISUAL=vim

# aliases
alias v='vim'
alias l='ls'
alias q='exit'
alias rr='ranger'

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
alias  dkei='docker exec -it'
alias dkeir='docker exec -it --user root'

## functions

# Go back to the parent directory n times
up()
{
  number="${1:-1}"
  for i in $(seq "${number}"); do
    cd ..
  done
  return 0
}

# Run a command n times
repeat()
{
  number="${1:-1}"
  shift
  command=$@
  for i in $(seq "${number}"); do
    $command
  done
  return 0
}

# Make a directory and cd into it
mkcd()
{
  mkdir -p "$1" && cd "$1"
  return 0
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# include shell configuration, if it exists 
[ -f ~/.profile ] && source ~/.profile

export HISTFILE=~/.bash_history

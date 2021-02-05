# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# include shell configuration, if it exists 
[ -f ~/.profile ] && source ~/.profile

EXPORT HISTFILE=~/.bash_history

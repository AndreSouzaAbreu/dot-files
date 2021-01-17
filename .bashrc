#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -f ~/.bash_profile ]]; then
	. ~/.bash_profile
fi

if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi

eval "$(zoxide init bash)"

export PATH=$PATH:$HOME/.bin
export EDITOR=vim

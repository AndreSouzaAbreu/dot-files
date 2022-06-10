#!/bin/bash
[[ -f ~/.profile ]] && source ~/.profile

# history settings

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

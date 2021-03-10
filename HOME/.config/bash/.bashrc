#!/bin/bash

# include shell configuration, if it exists
# this loads all environment variables, aliases, and functions
shell_profile=~/.config/shell/profile
[ -f $shell_profile  ] && source $shell_profile

# custom prompt
PS1='\[\033[00;32m\]\u \[\033[00;37m\][\w] '

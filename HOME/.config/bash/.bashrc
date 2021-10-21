#!/bin/bash

# include shell configuration, if it exists
# this loads all environment variables, aliases, and functions
shell_profile=~/.config/shell/profile
[ -f $shell_profile  ] && source $shell_profile

# bash prompts
function ps0() {
	PS1="[\$(basename \$(dirname \$(dirname "\$PWD")))/\$(basename \$(dirname "\$PWD"))/\$(basename "\$PWD")]\$ "
}

function ps1() {
	PS1='\[\033[00;32m\]\u@\h \[\033[00;37m\][\w] '
}

function ps2() {
	PS1='[\w]$ '
}

function ps3() {
	PS1='$ '
}

# default prompt
ps0

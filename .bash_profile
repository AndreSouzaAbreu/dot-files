#!/bin/bash

# custom shell prompt
function customprompt() {
    # the current number of lines in bash history:
    bash_history_size=$(fc -l -1)
    bash_history_size=${bash_history_size%%[^0-9]*}

    # set an initial value to the number of lines
    # in bash history stored from the last time
    # this function was executed. This avoids bugs
    # when running the first command in the current
    # shell session

    if [ -z "$bash_history_lastsize" ]; then
        bash_history_lastsize=0
    fi

    # if the current number of lines in bash history
    # is different from the last number of lines, then
    # we print the user name and the current directory.
    # otherwise, we just print >>

    if [[ $bash_history_size -eq $bash_history_lastsize ]]; then
        PS1='$ '
    else
        PS1='\[\033[01;32m\]\u \[\033[00m\]`pwd`:\n$ '
    fi

    # update the last value to the current value
    bash_history_lastsize=${bash_history_size}
}

PROMPT_COMMAND=customprompt

# Easily add, edit, view, or sync aliases
function aliases() {
    case "$1" in
		edit) $EDITOR ~/.bash_aliases ;;
		sync) source ~/.bash_aliases ;;
		add)
			shift
			name=$1
			shift
			echo "alias $name='$@'" >> ~/.bash_aliases
			;;
		*) alias ;;
    esac
	return 0
}

# Easily edit, view, or sync bash_profile
function profile() {
    case "$1" in
		edit) $EDITOR ~/.bash_profile ;;
		sync) source ~/.bash_profile ;;
		*) cat ~/.bash_profile ;;
    esac
	return 0
}

# Go back to the parent directory n times
# @param {integer} $n
function up() {
	number="${1:-1}"
	for i in $(seq $number); do
		cd ..
	done
	return 0
}

# Make a file and cd into it
# @param {string} $dir
function mkcd() {
    mkdir -p "$1" && cd "$1"
	return 0
}

# Run a command n times
# @param {integer} $n
# @param {string} $command
function repeat() {
	number="${1:-1}"
	shift
	command=$@
	for i in $(seq $number); do
		$command
	done
	return 0
}

# append new line to perl-lorem's output
function lorem() {
	/usr/bin/vendor_perl/lorem $@ && echo
	return 0
}

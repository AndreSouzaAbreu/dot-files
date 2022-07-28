# ------------------------------------------------------------------------------
# ZSH OPTIONS

# enable comments
setopt interactivecomments

# Disable the bultin 'repeat' to overwrite it
disable -r repeat

# ------------------------------------------------------------------------------
# HISTORY FILE

export HISTFILE="${XDG_DATA_HOME}/zsh/history"
setopt extendedglob appendhistory hist_ignore_all_dups hist_ignore_space

# when Up or Down keys are pressed only the past commands matching the current
# line up to the current cursor position will be shown

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[ -n "${key[Up]}"   ] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[ -n "${key[Down]}" ] && bindkey -- "${key[Down]}" down-line-or-beginning-search

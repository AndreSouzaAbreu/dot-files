#!/bin/zsh

#####################
# ZSH CONFIGURATION #
#####################

# include shell configuration, if it exists
# this loads all environment variables, aliases, and functions
shell_profile=~/.config/shell/profile
[ -f $shell_profile ] && source $shell_profile

## HISTORY #####################################################

export HISTFILE="${XDG_DATA_HOME}/zsh/history"
setopt extendedglob appendhistory hist_ignore_all_dups hist_ignore_space

## PROMPT ######################################################

PROMPT="%F{#0f0}%n%F{#fff}@%F{#0f0}%m %F{fff}[%~]%F{fff} "

## AUTO COMPLETION #############################################

# Basic auto/tab complete:
autoload -U compinit
compinit

# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
zmodload zsh/complist

# Include hidden files.
_comp_options+=(globdots)   

## CACHE #######################################################

compinit -d ${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}

## VIM #########################################################

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

## PLUGINS #####################################################

zsh_plugin_dir=/usr/share/zsh/plugins
zsh_plugin_suggestion=${zsh_plugin_dir}/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh_plugin_highlight=${zsh_plugin_dir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f $zsh_plugin_suggestion ]] && source $zsh_plugin_suggestion
[[ -f $zsh_plugin_highlight ]] && source $zsh_plugin_highlight

## HIGHLIGHT ###################################################

# ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[builtin]=fg=pink
# ZSH_HIGHLIGHT_STYLES[function]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[command]=fg=brown

## KEY BINDINGS ################################################

# create a zkbd compatible hash
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

## HISTORY SEARCH ##############################################

# only the past commands matching the current line up to the current
# cursor position will be shown when Up or Down keys are pressed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

## COMMAND LINE NAVIGATION #####################################

# Shift, Alt, Ctrl and Meta modifiers
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

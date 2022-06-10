#!/bin/zsh

# ##############################################################################
# ZSH CONFIGURATION
#
# ##############################################################################


################################################################################
# OPTIONS

# enable comments
setopt interactivecomments

# Disable the bultin 'repeat' to overwrite it
disable -r repeat

# set history file options
export HISTFILE="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/history"
setopt extendedglob appendhistory hist_ignore_all_dups hist_ignore_space

################################################################################
# PROMPT

function p0() {
	PROMPT="$ "
}

function p1() {
	PROMPT="[%~] "
}

function p2() {
	PROMPT="[%3d]$ "
}

function p3() {
	PROMPT="[%~]"$'\n'"$ "
}

function p4() {
	PROMPT="[%d]"$'\n'"$ "
}

function p5() {
	PROMPT='[%F{#0f0}%n%F{#fff}@%F{#0f0}%m %F{fff}%2d]%F{fff} '$'\n'"$ "
}

function p6() {
	PROMPT='[%F{#0f0}%n%F{#fff}@%F{#0f0}%m %F{fff}%~]%F{fff} '$'\n'"$ "
}

# default prompt
p5

################################################################################
# AUTO COMPLETION

# Basic tab complete:
autoload -U compinit
compinit

# autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

# include hidden files in completion
_comp_options+=(globdots)   

# autocompletion with an arrow-key driven interface
zmodload zsh/complist
zstyle ':completion:*' menu select

# load cache for completion
compinit -d ${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd or z
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -1 --color=always $realpath'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

################################################################################
# VIM KEYBINDINGS

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

################################################################################
# PLUGINS

function load_plugin_by_name()
{
	local plugin_dir=/usr/share/zsh/plugins
	while [[ -n $1 ]]; do
		plugin_name=$1
		plugin=${plugin_dir}/${plugin_name}/${plugin_name}.plugin.zsh
		[[ -f $plugin ]] && source ${plugin}
		shift
	done
}

load_plugin_by_name zsh-autosuggestions fast-syntax-highlighting fzf-tab

################################################################################
# HIGHLIGHT

# this configuration is for the plugin zsh-syntax-highlighting
# i'm using the fast-syntax-highlighting instead...

# my custom colors:

# ZSH_HIGHLIGHT_STYLES[alias]=fg=yellow
# ZSH_HIGHLIGHT_STYLES[builtin]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[function]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[command]=fg=green
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=magenta
# ZSH_HIGHLIGHT_STYLES[path]=fg=cyan
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=white
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=white
# ZSH_HIGHLIGHT_STYLES[comment]=fg=245

# default colors:

# ZSH_HIGHLIGHT_STYLES[assign]=none
# ZSH_HIGHLIGHT_STYLES[default]=none
# ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
# ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
# ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
# ZSH_HIGHLIGHT_STYLES[commandseparator]=none
# ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
# ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
# ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
# ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
# ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
# ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
# ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
# ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
# ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
# ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
# ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
# ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
# ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline

################################################################################
# KEYMAPS

# create a zkbd compatible hash
# to add other keys to this hash see: man 5 terminfo
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

# Shift, Alt, Ctrl and Meta modifiers
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

################################################################################
# HISTORY SEARCH

# only the past commands matching the current line up to the current
# cursor position will be shown when Up or Down keys are pressed

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

################################################################################
# SHELL PROFILE

# load shell profile, which has aliases, functions, and env vars
shell_profile=~/.config/shell/profile
[[ -f $shell_profile ]] && source $shell_profile

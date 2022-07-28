# ------------------------------------------------------------------------------
# ZSH KEYBINDINGS

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -v '^?' backward-delete-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# ------------------------------------------------------------------------------
# ZSH KEYMAPS

# create a zkbd compatible hash
# to add other keys to this hash see: man 5 terminfo
typeset -g -A key
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Down]="${terminfo[kcud1]}"
key[End]="${terminfo[kend]}"
key[Home]="${terminfo[khome]}"
key[Insert]="${terminfo[kich1]}"
key[Left]="${terminfo[kcub1]}"
key[PageDown]="${terminfo[knp]}"
key[PageUp]="${terminfo[kpp]}"
key[Right]="${terminfo[kcuf1]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Up]="${terminfo[kcuu1]}"

# setup key accordingly
[ -n "${key[Backspace]}" ] && bindkey -- "${key[Backspace]}"  backward-delete-char
[ -n "${key[Delete]}"    ] && bindkey -- "${key[Delete]}"     delete-char
[ -n "${key[Down]}"      ] && bindkey -- "${key[Down]}"       down-line-or-history
[ -n "${key[End]}"       ] && bindkey -- "${key[End]}"        end-of-line
[ -n "${key[Home]}"      ] && bindkey -- "${key[Home]}"       beginning-of-line
[ -n "${key[Insert]}"    ] && bindkey -- "${key[Insert]}"     overwrite-mode
[ -n "${key[Left]}"      ] && bindkey -- "${key[Left]}"       backward-char
[ -n "${key[PageDown]}"  ] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[ -n "${key[PageUp]}"    ] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[ -n "${key[Right]}"     ] && bindkey -- "${key[Right]}"      forward-char
[ -n "${key[Shift-Tab]}" ] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[ -n "${key[Up]}"        ] && bindkey -- "${key[Up]}"         up-line-or-history

# Shift, Alt, Ctrl and Meta modifiers
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
[ -n "${key[Control-Left]}"  ] && bindkey -- "${key[Control-Left]}"  backward-word
[ -n "${key[Control-Right]}" ] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is active.
# Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
	zle_application_mode_start() { echoti smkx }
	zle_application_mode_stop()  { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

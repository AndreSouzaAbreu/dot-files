# ------------------------------------------------------------------------------
# ZSH COMPLETION

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
zstyle ':fzf-tab:complete:z:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

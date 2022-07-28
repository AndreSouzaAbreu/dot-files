# ------------------------------------------------------------------------------
# ZSH PLUGINS

load_plugin_by_name()
{
	local plugin_dir=/usr/share/zsh/plugins
	while [ -n "${1}" ]; do
		plugin_name=$1
		plugin=${plugin_dir}/${plugin_name}/${plugin_name}.plugin.zsh
		[ -f "${plugin}" ] && source "${plugin}"
		shift
	done
}

load_plugin_by_name zsh-autosuggestions zsh-abbr fzf-tab fast-syntax-highlighting 
 
# ------------------------------------------------------------------------------
# ZSH SYNTAX HIGHLIGHT

# this configuration is for the plugin zsh-syntax-highlighting
# i'm using the fast-syntax-highlighting instead ...

# my custom colors:

#ZSH_HIGHLIGHT_STYLES[alias]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[builtin]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[command]=fg=green
#ZSH_HIGHLIGHT_STYLES[comment]=fg=245
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=white
#ZSH_HIGHLIGHT_STYLES[function]=fg=cyan
#ZSH_HIGHLIGHT_STYLES[path]=fg=cyan
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=white

# default colors:

#ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
#ZSH_HIGHLIGHT_STYLES[assign]=none
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
#ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
#ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
#ZSH_HIGHLIGHT_STYLES[commandseparator]=none
#ZSH_HIGHLIGHT_STYLES[default]=none
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
#ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
#ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
#ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
#ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
#ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
#ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009

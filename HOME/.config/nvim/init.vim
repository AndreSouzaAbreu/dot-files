" ------------------------------------------------------------------------------
" VIM                                                                          |
" ------------------------------------------------------------------------------

" the following settings make it possible to share
" plugins and configuration between vim and neovim

set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after
set runtimepath+=$XDG_CONFIG_HOME/vim/ultisnips
let &packpath = &runtimepath

source $VIMRC-options
source $VIMRC-plugins
source $VIMRC-keymaps
source $VIMRC-autocommands
source $VIMRC-abbreviations
source $VIMRC-functions

" ------------------------------------------------------------------------------
" NEOVIM                                                                       |
" ------------------------------------------------------------------------------

set termguicolors

" source config for nvim only
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/keymaps.vim
lua require("init")

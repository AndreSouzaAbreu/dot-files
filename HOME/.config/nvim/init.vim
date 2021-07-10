""""""""""""""""""""""""""""""""""""""""""""
" VIM 
""""""""""""""""""""""""""""""""""""""""""""

" the following settings make it possible to share
" plugins and configuration between vim and neovim

set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after
set runtimepath+=$XDG_CONFIG_HOME/vim/ultisnips
let &packpath = &runtimepath

source $VIMRC-general
source $VIMRC-plugins
source $VIMRC-keybindings
source $VIMRC-autocommands
source $VIMRC-abbreviations
source $VIMRC-userfunctions

""""""""""""""""""""""""""""""""""""""""""""
" NEOVIM
""""""""""""""""""""""""""""""""""""""""""""

" the following settings are for neovim only
" they may not work with vim.

nnoremap <leader>S :source $NVIMRC<CR>

""" Terminal Mode

function! TerminalOpen()
  setlocal nonumber norelativenumber noshowmode noruler noshowcmd laststatus=0
  nnoremap <buffer> <C-P> pi<Home><space><left>
endfunction

autocmd TermOpen * call TerminalOpen() | startinsert
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

tnoremap <A-q> <C-\><C-N>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-1> <C-\><C-N>:bp<CR>
tnoremap <A-2> <C-\><C-N>:bn<CR>
tnoremap <C-=> <C-\><C-N>:FontPlus<CR>a
tnoremap <C--> <C-\><C-N>:FontMinus<CR>a

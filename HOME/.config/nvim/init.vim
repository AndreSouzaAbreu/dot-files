" ---------------------------------------------------------------------------
" VIM 
" ---------------------------------------------------------------------------

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

" ---------------------------------------------------------------------------
" NEOVIM
" ---------------------------------------------------------------------------

" the following settings are for neovim only (they may not work with vim)

" justify alignment
" packadd justify

" fzf 
function! FzfOpen()
  inoremap <buffer> <Esc> <C-c><Esc>
  tnoremap <buffer> <Esc> <C-c><C-\><C-n>
endfunction()
autocmd FileType fzf call FzfOpen()

" TERMINAL ------------------------------------------------------------------

function! TerminalOpened()
  " hi BlackBg guibg=black
  setlocal nonumber norelativenumber noshowmode noruler noshowcmd laststatus=0
  " setlocal winhighlight=Normal:BlackBg
  nnoremap <buffer> <C-P> pi<Home><space><left>
  nnoremap <buffer> o A
  nnoremap <buffer> O A
endfunction

autocmd TermOpen * call TerminalOpened() | startinsert
autocmd BufLeave term://* stopinsert

" terminal window navigation
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" terminal window resizing
tnoremap <silent> <A-S-j> <C-\><C-N>:resize -5<cr>
tnoremap <silent> <A-S-k> <C-\><C-N>:resize +5<cr>
tnoremap <silent> <A-S-h> <C-\><C-N>:vertical resize -5<cr>
tnoremap <silent> <A-S-l> <C-\><C-N>:vertical resize +5<cr>

" terminal buffer navigation
tnoremap <A-1> <C-\><C-N>:bp<CR>
tnoremap <A-2> <C-\><C-N>:bn<CR>

" toggle terminal
nnoremap <silent> <A-s> :call TgtToggleH()<CR>
tnoremap <silent> <A-s> <C-\><C-n>:call TgtToggleH()<CR>
nnoremap <silent> <A-S-s> :call TgtToggleV()<CR>
tnoremap <silent> <A-S-s> <C-\><C-n>:call TgtToggleV()<CR>

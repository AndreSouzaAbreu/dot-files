" ------------------------------------------------------------------------------
" TERMINAL

function! TerminalOpened()
  setlocal nonumber norelativenumber nobuflisted noshowmode noruler noshowcmd laststatus=0 colorcolumn=-1
endfunction

autocmd TermOpen * call TerminalOpened() | startinsert
autocmd BufLeave term://* stopinsert

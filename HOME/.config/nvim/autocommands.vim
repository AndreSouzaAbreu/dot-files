" ------------------------------------------------------------------------------
" TERMINAL

function! TerminalOpened()
  setlocal nonumber norelativenumber noshowmode noruler noshowcmd laststatus=0 colorcolumn=-1
endfunction

autocmd TermOpen * call TerminalOpened() | startinsert
autocmd BufLeave term://* stopinsert

" justify text
nmap <silent> <M-S-9> :nunmap ,gq<CR>:xunmap ,gq<CR>
nmap <silent> <M-9> :packadd justify<CR>vipk:call Justify('tw',4)<CR><M-S-9>

" terminal window navigation
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" terminal escape
tnoremap <A-e> <C-\><C-n>
tnoremap <S-Esc> <C-\><C-n>

" terminal window resizing
tnoremap <silent> <A-S-j> <C-\><C-N>:resize -4<cr>
tnoremap <silent> <A-S-k> <C-\><C-N>:resize +4<cr>
tnoremap <silent> <A-S-h> <C-\><C-N>:vertical resize -4<cr>
tnoremap <silent> <A-S-l> <C-\><C-N>:vertical resize +4<cr>

" terminal buffer navigation
tnoremap <A-1> <C-\><C-N>:BufferNext<CR>
tnoremap <A-2> <C-\><C-N>:BufferPrev<CR>

" TOGGLE TERM
let g:toggleterm_terminal_mapping = '<M-s>'
nnoremap <silent><M-s>   <Cmd>exe v:count1 . "ToggleTerm size=5"<CR>
nnoremap <silent><M-S-s> <Cmd>exe v:count1 . "ToggleTerm size=40 direction=vertical"<CR>

" BUFFER DELETE
nnoremap <Bslash>bd :Bdelete<CR>
nnoremap <Bslash>bD :Bdelete!<CR>

" BUFFER DELETE
nnoremap <Bslash>bn :BufferNext<CR>
nnoremap <Bslash>bp :BufferPrev<CR>
nnoremap <M-1> :BufferPrev<CR>
nnoremap <M-2> :BufferNext<CR>
nnoremap <M-S-1> :BufferMovePrev<CR>
nnoremap <M-S-2> :BufferMoveNext<CR>

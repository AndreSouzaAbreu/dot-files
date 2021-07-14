" gui font
set guifont=Source\ Code\ Pro:h11

" command to increase/decrease font size in neovim-gt
command! -bar FontPlus  :execute "GuiFont " . substitute(g:GuiFont, '\d\+', '\=submatch(0)+2', '')
command! -bar FontMinus :execute "GuiFont " . substitute(g:GuiFont, '\d\+', '\=submatch(0)-2', '')

" keybindings to increase/decrease font size in neovim-qt
nnoremap <C-=> :FontPlus<CR> 
nnoremap <C--> :FontMinus<CR> 
tnoremap <C-=> <C-\><C-N>:FontPlus<CR>a
tnoremap <C--> <C-\><C-N>:FontMinus<CR>a

" disable tabline
GuiTabline 0

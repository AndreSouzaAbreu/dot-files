" NVIM GUI CONFIG

" some nice fonts

" set guifont=FreeMono:h14
" set guifont=Inconsolata:h16
" set guifont=JetBrains\ Mono:h14
" set guifont=Liberation\ Mono:h14
" set guifont=Perfect\ DOS\ VGA\ 437:h18
" set guifont=Source\ Code\ Pro:h13
set guifont=Iosevka\ Term:h14

" command to increase/decrease font size in neovim-gt
command! -bar FontPlus  :execute "GuiFont " . substitute(g:GuiFont, '\d\+$', '\=submatch(0)+1', '')
command! -bar FontMinus :execute "GuiFont " . substitute(g:GuiFont, '\d\+$', '\=submatch(0)-1', '')

" keybindings to increase/decrease font size in neovim-qt
nnoremap <C-=> :FontPlus<CR> 
nnoremap <C--> :FontMinus<CR> 
tnoremap <C-=> <C-\><C-N>:FontPlus<CR>a
tnoremap <C--> <C-\><C-N>:FontMinus<CR>a

" disable tabline
GuiTabline 0

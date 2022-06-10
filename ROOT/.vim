" ------------------------------------------------------------------------------
" VIMRC                                                                        |
" ------------------------------------------------------------------------------

" this file contains general settings for vim.
" The settings are divided into categories, and
" are sorted alphabetically inside each category.

" first, set vim to not be compatible with vi,
" which is required for some of vim's features

set nocompatible

" ------------------------------------------------------------------------------
" INDENTATION                                                                  |
" ------------------------------------------------------------------------------

" automatic indentation
set autoindent smartindent

" width, in characters, for the indent operator > 
set shiftwidth=2

" amount of characters occupied by pressing <TAB>
" (if the value is different than tabstop, vim will insert a combination of
" tabs and spaces to simulate the tab width).
set softtabstop=2

" width, in characters, of a <TAB>
set tabstop=2

" whether to convert tabs to space
set expandtab!

" ------------------------------------------------------------------------------
" SEARCH                                                                       |
" ------------------------------------------------------------------------------

" highlight search while typing
set incsearch

" highlight all strings matching the search pattern
set hlsearch

" make path include current dir, dir of current file, and subdirs
set path=.,,**

" ignore some directories when searching files
set wildignore+=**/node_modules/** 
set wildignore+=**/vendor/** 
set wildignore+=**/__pycache__/** 
set wildignore+=**/.cache/** 
set wildignore+=**/.git/** 

" ------------------------------------------------------------------------------
" BUFFERS                                                                      |
" ------------------------------------------------------------------------------

" auto load file changes
set autoread

" enable backspace to delete char
set backspace=indent,eol,start

" text encoding
set encoding=utf8

" folding settings
set foldmethod=indent foldlevel=99

" prevent warnings when exiting modified buffer
set hidden

" lazy screen redraw when using macros
set lazyredraw

" relative line numbers
set number relativenumber

" enable syntax highlighting
syntax on

" how many lines to show below/above the cursor
set scrolloff=0

" don't wrap lines!
set wrap!

" ------------------------------------------------------------------------------
" AUTO COMPLETE                                                                |
" ------------------------------------------------------------------------------

" include dictionary
set complete+=kspell

" show complete menu by pressing <C-P> (default), longest matches first.
set completeopt=menuone,longest,preview

" don't show notifications when showing completion suggestions
set shortmess+=c

" turn on spell to get completion for words in dictionary
set spell

" spell language
set spelllang=en_us

" ------------------------------------------------------------------------------
" CURSOR                                                                       |
" ------------------------------------------------------------------------------

" nightlight current cursor line
set cursorline

" activate mouse on all modes
set mouse=a

" ------------------------------------------------------------------------------
" CMDLINE                                                                      |
" ------------------------------------------------------------------------------

" hide status line by default
set laststatus=0

" show suggestions for selection/commands
set wildmenu

" size of command history
set history=5000

" ------------------------------------------------------------------------------
" CHARACTERS                                                                   |
" ------------------------------------------------------------------------------

" custom chars for invisible characters
set listchars=eol:¬,tab:↳\ ,trail:~,extends:>,precedes:<,space:·

" Char Unicode
" ↲    u21b2
" ↳    u21b3
" →    u2192
" •    u2022
" ◦    u25e6
" ‧    u2027
" ▪    u25aa

" more at: https://www.w3schools.com/charsets/ref_utf_punctuation.asp
" press <C-v> in Insert Mode then type the unicode to insert UTF-8 char

" ------------------------------------------------------------------------------
" NETRW (DEFAULT FILE MANAGER)                                                 |
" ------------------------------------------------------------------------------

" open files to the right
let g:netrw_altv=1

" turn off top banner
let g:netrw_banner=0

" set default style view
let g:netrw_liststyle=3

" n layout
" 0 default
" 1 details
" 2 column
" 3 tree

" open preview of files to the right
let g:netrw_preview=1

" initial size of the file menu (percentage of the window)
let g:netrw_winsize=20

" ------------------------------------------------------------------------------
" WINDOW                                                                       |
" ------------------------------------------------------------------------------

" more natural window splitting
set splitbelow
set splitright

" ------------------------------------------------------------------------------
" KEYBINDINGS                                                                  |
" ------------------------------------------------------------------------------

" the leader key
let mapleader=","

" do nothing when pressing space or \ twice
nnoremap <space> <nop>
nnoremap <Bslash><Bslash> <Nop>

" ------------------------------------------------------------------------------
" BUFFERS

" buffer navigation keybindings
nnoremap <Bslash>bn :bn<CR>
nnoremap <Bslash>bp :bp<CR>
nnoremap <Bslash>bd :bd<CR>
nnoremap <M-1> :bn<CR>
nnoremap <M-2> :bp<CR>
nnoremap gb :b<space>

" close and save file easily
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>a :qall!<CR>

" ------------------------------------------------------------------------------
" WINDOW

" window split
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" window resize
nnoremap <silent> <M-S-j> :resize -5<cr>
nnoremap <silent> <M-S-k> :resize +5<cr>
nnoremap <silent> <M-S-h> :vertical resize -5<cr>
nnoremap <silent> <M-S-l> :vertical resize +5<cr>

" ------------------------------------------------------------------------------
" MISCELLANEOUS

" clear highlight from previous searc
nnoremap <silent> <Bslash>l :noh<CR>

" search and replace word under cursor
nnoremap <space>w :%s/<C-r><C-w>/

" move lines up/down without using clipboard
nnoremap <M-o> :m .-2<CR>==
nnoremap <M-i> :m .+1<CR>==
vnoremap <M-i> :m '>+1<CR>gv=gv
vnoremap <M-o> :m '<-2<CR>gv=gv

" navigate between methods of a class
nnoremap <Bslash>, ]m
nnoremap <Bslash>. [m

" toggle line wrap
nnoremap <M-w> :set wrap!<CR>

" toggle display of invisible chars
nnoremap <silent> <leader>l :set list!<CR>

" toggle automatic comments on new lines
nnoremap <leader>c :set formatoptions=ql<CR>
nnoremap <leader>C :set formatoptions=qlcro<CR>

" toggle file explorer
nnoremap <leader>d :Lexplore<CR>

" ------------------------------------------------------------------------------
" ABBREVIATIONS                                                                |
" ------------------------------------------------------------------------------

" fix misspelling in command mode
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

" ------------------------------------------------------------------------------
" BUG FIXES                                                                    |
" ------------------------------------------------------------------------------

" Map the escape characters to their alt combinations
" @see https://stackoverflow.com/questions/6778961/

let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endwhile
let c='A'
while c <= 'A'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endwhile

" timeout for keys
set ttimeout ttimeoutlen=50

" fix mouse bug in some terminal emulators
set ttymouse=xterm2

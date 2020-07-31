filetype on
filetype indent on
filetype plugin on

syntax on
set autoindent

set background=dark

set number
set relativenumber

" highlight search
set hls
" show the next match while entering a search
set incsearch
" ignore case
set ignorecase
" ignore case only when lower letter search expression
set smartcase

set lbr

" show command in bottom bar
set showcmd

" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" tabs are spaces
set expandtab
set shiftwidth=4

" show indicator at line breaks
set showbreak=↪\ 

set virtualedit=block

" disable modeline for security reasons
set nomodeline

" open new vertical split to the right
set splitright
" open new horizontal split on the bottom
set splitbelow

" when a bracket is inserted, briefly jump to the matching one
set showmatch
set matchtime=3

" highlight current line with dark grey background
highlight CursorLine cterm=None ctermbg=236
set cursorline

" recursive search in subdirectories for find command
set path+=**

" show all candidates for tab-completion
set wildmenu
" case insensitive file completion
set wildignorecase

" completion
" complete to longest common match instead of first menu entry
set completeopt+=longest

" enable syntax omnicompletion only if a specific plugin does not already
" exist for the current filetype
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
endif


" mappings
let mapleader = " "
let maplocalleader = "\\"

inoremap jk <ESC>

nnoremap <leader>hl :nohlsearch<CR>

" newline without entering insert mode
nnoremap <C-J> o<ESC>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>es :vsplit $HOME/.config/sway/config<CR>
nnoremap <leader>er :vsplit $HOME/.config/ranger/rc.conf<CR>

" commands
" change working directory to currently open file's directory
command CDCURR cd %:p:h
" on command line expand %% to open file's directory
cabbr <expr> %% expand('%:p:h')

let g:markdown_folding = 1
set foldlevelstart=99

"set rtp^=/home/cmullov/.vim

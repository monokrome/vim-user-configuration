" Temporary settings for working on new Vim configuration
set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on
colorscheme solarized

set lazyredraw
set showmode
set wildmenu

set expandtab
set smartindent

set tabstop=2
set shiftwidth=2

nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

set hidden

set clipboard=unnamed

" These are so annoying.
set noerrorbells 
set novisualbell
set t_vb=

autocmd! GUIEnter * set vb t_vb=

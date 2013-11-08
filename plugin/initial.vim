" Temporary settings for working on new Vim configuration
set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

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

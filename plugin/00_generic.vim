set nocompatible

" Use tabs by default, instead of separate windows.
tab all

" Prevent Vim from giving me a hard time for opening multiple files.
set shortmess+=o

" Don't wrap text
set nowrap
set textwidth=79


" Show matching brace highlights
set showmatch

" Make the cursorline a full line highlight
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Show cursorline in the currently active window
" TODO: Fix this for tabs
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

" This seems to fix WinEnter not occuring when a new Vim instance is created.
" setlocal cursorline

" Don't draw while macros actions are being performed.
set lazyredraw

" Always show the ruler for information about the current file
set ruler

" Better tab completion
set wildmode=longest:full
set wildmenu

" Case-insensitive searches unless caps are explicitly provided
set ignorecase
set smartcase

" Required to enable omnifunc completion
filetype plugin indent on

" Add git information to the status line from fugitive
set statusline+=%{fugitive#statusline()}

" Defualt to not have any folds
set foldlevelstart=99

" Powerline
let g:Powerline_symbols = 'fancy'

" Highlight the results from last search
set hls

" Set comma to the leader key
let mapleader=','

" Put undo files in tmp directory
set undodir^=~/.vim/tmp/undo//

" Update bundles!
noremap <leader>b :BundleInstall!<CR>


" Disable Vi compatibility features
set nocompatible

" Use tabs by default, instead of separate windows.
tab all

" Prevent Vim from giving me a hard time for opening multiple files.
set shortmess+=o

" Don't wrap text
set nowrap

" Show matching brace highlights
set showmatch

" Make the cursorline a full line highlight
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Show cursorline in the currently active window
" TODO: Fix this for tabs
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" This seems to fix WinEnter not occuring when a new Vim instance is created.
setlocal cursorline


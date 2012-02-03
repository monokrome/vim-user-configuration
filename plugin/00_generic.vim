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

" Highlight the current line
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Show cursorline in the currently active window
autocmd WinEnter * setlocal curslorline
autocmd WinLeave * setlocal nocurslorline


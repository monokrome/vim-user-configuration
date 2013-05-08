set nocompatible

" Make the cursorline a full line highlight
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Show cursorline in the currently active window
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

" This seems to fix WinEnter not occuring when a new Vim instance is created.
" setlocal cursorline


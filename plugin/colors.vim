syntax on
colorscheme solarized

" Cursor
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=bold
hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=bold

" Gutter
hi SignColumn ctermbg=black guibg=black
hi LineNr ctermbg=black guibg=black
hi CursorLineNr ctermbg=black guibg=black

" Splits
hi VertSplit ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE

" Solarized
let g:solarized_contrast="high"
let g:solarized_hitrail=1

set background=dark

" Long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

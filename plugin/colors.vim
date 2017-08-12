syntax on

colorscheme base16-solarized-dark

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

" Badwolf
let g:badwofl_html_link_underline = 0
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 0
let g:badwolf_css_props_highlight = 1

" Use dark background for solarized theme
set background=dark

" Highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

"
hi VertSplit ctermbg=NONE ctermfg=bg guifg=bg guibg=NONE

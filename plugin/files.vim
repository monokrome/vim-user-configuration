" Encode documents in UTF-8 by default
set enc=UTF-8
set fenc=UTF-8
set termencoding=UTF-8

" Use tree-style directory listings
let g:netrw_liststyle=3

" Change how vim creates backup files
set backupdir=~/.vim/backup/,./
set directory=~/.vim/backup/,./

" Some NERDtree stuff
let NERDTreeMinimalUI=1
let NERDTreeHighlightCursorline=1
let NERDTreeHighlightCursorlineeeMouseMode=2
let NERDTreeIgnore=['\.pyc$']
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'
let NERDTreeMapHelp='h'
let NERDTreeMapUpdir='-'
let NERDTreeMapUpdirKeepOpen='_'


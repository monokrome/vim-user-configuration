" Encode documents in UTF-8 by default
set enc=UTF-8
set fenc=UTF-8
set termencoding=UTF-8
set foldmethod=syntax

" Use tree-style directory listings
let g:netrw_liststyle=3

" Some NERDtree stuff
let NERDTreeMinimalUI=1
let NERDTreeHighlightCursorline=1
let NERDTreeHighlightCursorlineMouseMode=2
let NERDTreeIgnore=['\.pyc$']
let NERDTreeMapOpenVSplit='|'
let NERDTreeMapOpenSplit='_'
let NERDTreeMapHelp='?'
let NERDTreeDirArrows=1

let g:gundo_width = 40
let g:gundo_preview_height = 40
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_close_on_revert = 1

noremap <leader>g :GundoToggle<CR>


" Encode documents in UTF-8 by default
set enc=UTF-8
set fenc=UTF-8
set termencoding=UTF-8
set foldmethod=syntax

" Use tree-style directory listings
let g:netrw_liststyle=3

let g:gundo_width = 40
let g:gundo_preview_height = 40
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_close_on_revert = 1

noremap <leader>g :GundoToggle<CR>

set wildignore+=*/node_modules/*,*/lib/python*,*.pid,*.pyc,*.iml,*.rdb,*.db,*.sqlite,*.sqlite3,*/Session.vim,*.log


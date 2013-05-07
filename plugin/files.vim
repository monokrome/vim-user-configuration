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

" Make NERDTree use netrw
let NERDTreeHijackNetrw=1

" Show line numbers
set number

" Map ,u to show the GUndo pane
noremap <leader>u :GundoToggle<CR>

" Default filenames that Vim should ignore for file listings and such
set wildignore=*/node_modules/*,*/lib/python*,*.pid,*.pyc,*.iml,*.rdb,*.db,*.sqlite,*.sqlite3,*/Session.vim,*.log,*.o

" Don't use incsearch from vim-sensible
set noincsearch

" Hide current mode text
set noshowmode


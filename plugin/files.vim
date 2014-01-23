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

" Make vimfiler use netrw
let g:vimfiler_as_default_explorer = 1

" Map ,u to show the GUndo pane
noremap <leader>u :GundoToggle<CR>

" Default filenames that Vim should ignore for file listings and such
set wildignore=*/node_modules/*,*/lib/python*,*.pid,*.pyc,*.iml,*.rdb,*.db,*.sqlite,*.sqlite3,*/Session.vim,*.log,*.o

" Hide the ugly little tilde after EOF
highlight NonText ctermfg=black guifg=black

" Highlight search results
set hlsearch

" Don't wrap text
set nowrap

" Default expected width of documents
set textwidth=79

" Enable filetype-specific indentation
filetype plugin indent on

" Put undo files in tmp directory
set undodir^=~/.vim/tmp/undo//

" Prevent Vim from giving me a hard time for opening multiple files.
set shortmess+=o

" Remove all trailing white space when writing files
" autocmd BufWritePre * :%s/[^\\]\s\+$//e


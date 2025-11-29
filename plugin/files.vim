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
nnoremap <leader><space> :nohlsearch<CR>

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

if has('autocmd')
  autocmd CursorHold,BufWritePost,BufReadPost,BufLeave * if !$VIMSWAP && isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
  autocmd BufRead,BufNewFile *.muttrc,.muttrc,muttrc set filetype=muttrc
  autocmd BufRead,BufNewFile *.scons,SConstruct set filetype=python
  autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
endif


" Angular.JS
let g:angular_src_path = 'src/'


" Reload vimrc file whenever it changes
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


" Don't require JSX entension for JSX syntax highlighting
let g:jsx_ext_required = 0

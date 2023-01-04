" Indentation
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

" nnoremap <buffer> gd :TernDef<CR>
" nnoremap <buffer> K :TernDoc<CR>
" nnoremap <buffer> <localleader>rr :TernRename<CR>
" nnoremap <buffer> <localleader>/r :TernRefs<CR>
" nnoremap <buffer> <localleader>/t :TernType<CR>

" Code folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax

" Modify signs used by ale
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '>>'

" Add new filetypes to tern
let g:tern#filetypes = ['jsx']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Use prettier-eslint for linting and fixing code
let g:ale_javascript_prettier_use_local_config = 1

let s:ale_plugins = {
\   'javascript': [
\     'prettier',
\     'eslint',
\     'prettier-eslint',
\   ],
\ }

let b:ale_fixers = s:ale_plugins
let b:ale_linters = s:ale_plugins

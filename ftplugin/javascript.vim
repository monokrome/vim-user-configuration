" Indentation
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

nnoremap <buffer> gd :TernDef<CR>
nnoremap <buffer> K :TernDoc<CR>
nnoremap <buffer> <localleader>rr :TernRename<CR>
nnoremap <buffer> <localleader>/r :TernRefs<CR>
nnoremap <buffer> <localleader>/t :TernType<CR>

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
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   'javascript': ['prettier_eslint']
\ }

let g:ale_linters = {
\   'javascript': ['prettier_eslint']
\ }

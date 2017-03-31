" Indentation
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

nnoremap <buffer> gd :TernDef<CR>
nnoremap <buffer> K :TernDoc<CR>
nnoremap <buffer> <localleader>rr :TernRename<CR>
nnoremap <bufeer> <localleader>/r :TernRefs<CR>
nnoremap <bufeer> <localleader>/t :TernType<CR>

let g:syntastic_javascript_checkers = ['eslint']

" Code folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax

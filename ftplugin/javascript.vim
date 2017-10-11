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

" Use prettier-eslint for Neoformat
let g:neoformat_enabled_javascript=['prettier-eslint']

" Add new filetypes to tern
let g:tern#filetypes = ['jsx']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

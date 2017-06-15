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

" Set up prettier to use better flags
autocmd FileType javascript set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ all\ --no-semi

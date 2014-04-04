setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

" call JavaScriptFold()

nnoremap <buffer> gd :TernDef<CR>
nnoremap <buffer> K :TernDoc<CR>
nnoremap <buffer> <localleader>rr :TernRename<CR>
nnoremap <bufeer> <localleader>/r :TernRefs<CR>
nnoremap <bufeer> <localleader>/t :TernType<CR>

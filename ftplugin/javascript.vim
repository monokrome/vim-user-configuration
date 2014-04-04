setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

" call JavaScriptFold()

nnoremap <buffer> gd :TernDef<CR>
nnoremap <buffer> K :TernDoc<CR>
nnoremap <buffer> Cw :TernRename<CR>

" Other things to consider binding:
" 
" Find references:
"   :TernRefs<CR>
" 
" Get type of object:
"   :TernType<CR>

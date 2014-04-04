setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

" call JavaScriptFold()

nnoremap gd :TernDef<CR>
nnoremap K :TernDoc<CR>
nnoremap Cw :TernRename<CR>

" Other things to consider binding:
" 
" Find references:
"   :TernRefs<CR>
" 
" Get type of object:
"   :TernType<CR>

setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab

setlocal commentstring=//\ %s

" call JavaScriptFold()

nmap gd :TernDef<CR>
nmap K :TernDoc<CR>
nmap Cw :TernRename<CR>

" Other things to consider binding:
" 
" Find references:
"   :TernRefs<CR>
" 
" Get type of object:
"   :TernType<CR>

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" let g:python_host_prog = "/run/current-system/sw/bin/python"

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsListSnippets="<c-E>"

let s:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

imap <C-e>     <Plug>(neosnippet_expand_or_jump)
smap <C-e>     <Plug>(neosnippet_expand_or_jump)
xmap <C-e>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

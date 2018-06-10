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

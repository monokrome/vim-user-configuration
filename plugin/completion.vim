let deoplete#sources#jedi#show_docstring = 1

let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabContextDefaultCompletionType = "<c-p>"

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsListSnippets="<c-E>"

let s:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'

if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

augroup user_ftplugin_cpp
        autocmd FileType java setlocal noexpandtab
        autocmd FileType java setlocal list
augroup END


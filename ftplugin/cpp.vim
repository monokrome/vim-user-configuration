noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

if has('autocmd')
        augroup user_ftplugin_cpp
                autocmd FileType java setlocal noexpandtab
                autocmd FileType java setlocal list
        augroup END
endif

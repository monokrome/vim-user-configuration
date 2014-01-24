if has('autocmd')
        augroup user_ftplugin_java
                autocmd FileType java setlocal noexpandtab
                autocmd FileType java setlocal list
                autocmd FileType java setlocal listchars=tab:+\ ,eol:-
                autocmd FileType java setlocal formatprg=par\ -w80\ -T4
        augroup END
endif

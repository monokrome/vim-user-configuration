autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=4
autocmd FileType python set expandtab
autocmd FileType python set foldmethod=indent
autocmd FileType python setlocal commentstring=#\ %s

" YouCompleteMe navigation
noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>

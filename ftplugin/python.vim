autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set expandtab
autocmd FileType python set foldmethod=indent

" YouCompleteMe navigation
noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>

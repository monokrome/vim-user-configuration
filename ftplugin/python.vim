autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set expandtab
autocmd FileType python set foldmethod=indent

" YouCompleteMe navigation
noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Define sections as described in PEP8
noremap <buffer> [[ ?\n\n<CR>
noremap <buffer> ]] /\n\n<CR>


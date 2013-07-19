autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set expandtab
autocmd FileType python set foldmethod=indent

" YouCompleteMe navigation
noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Define sections by PEP8's two-line recommendation and by classes
noremap <buffer> [[ ?^\n\n\<bar>^\s*class<CR>
noremap <buffer> ]] /^\n\n\<bar>^\s*class<CR>

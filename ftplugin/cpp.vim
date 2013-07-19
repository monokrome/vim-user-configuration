" Switch between headers and source files with F4
map <F4> :e %:p:s,.h?$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" YouCompleteMe navigation
noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>


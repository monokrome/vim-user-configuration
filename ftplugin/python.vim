setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab

setlocal foldmethod=indent
setlocal commentstring=#\ %s

" YouCompleteMe navigation
noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>

setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

setlocal foldmethod=indent
setlocal commentstring=#\ %s

" Watch coffee stuff
noremap <buffer> <localleader>ws :CoffeeWatch<CR>
noremap <buffer> <localleader>wv :CoffeeWatch vert<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>:nohlsearch<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>:nohlsearch<CR>

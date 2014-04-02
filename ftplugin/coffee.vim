setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

setlocal foldmethod=indent
setlocal commentstring=#\ %s

" Watch coffee stuff
noremap <buffer> <leader>ws :CoffeeWatch<CR>
noremap <buffer> <leader>wv :CoffeeWatch vert<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>

" Watch coffee stuff
noremap <buffer> <leader>ws :CoffeeCompile watch<CR>
noremap <buffer> <leader>wv :CoffeeCompile watch vert<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>

" Watch coffee stuff
noremap <leader>ws :CoffeeCompile watch<CR>
noremap <leader>wv :CoffeeCompile watch vert<CR>

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>

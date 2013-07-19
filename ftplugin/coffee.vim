 Watch coffee stuff
noremap <leader>ws :CoffeeCompile watch<CR>
noremap <leader>wv :CoffeeCompile watch vert<CR>

" Define sections by classes
noremap <buffer> [[ ?^\n\n\<bar>^\s*class<CR>
noremap <buffer> ]] /^\n\n\<bar>^\s*class<CR>


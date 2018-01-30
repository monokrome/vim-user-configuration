" Yank text to the native clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the native clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Access the list of registers a bit more easily
noremap <leader>r :reg<CR>

" Changed clipboard to use unnamed
set clipboard=unnamed,unnamedplus

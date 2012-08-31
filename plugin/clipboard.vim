" Yank text to the native clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the native clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

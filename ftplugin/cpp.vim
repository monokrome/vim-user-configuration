" Switch between headers and source files with F4
map <F4> :e %:p:s,.h?$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Dispatch! :D
noremap <leader>m :Dispatch<CR>
noremap <leader>M :Dispatch!<CR>


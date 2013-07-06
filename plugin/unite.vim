" ctrl-p replacement
nno <leader>nrf :<C-u>Unite file_mru file_rec/async:! -start-insert<CR>
nno <leader>nf :<C-u>Unite file_rec file_rec/async:! -start-insert<CR>

" Change to recently used directories
nno <leader>nd :<C-u>Unite directory_mru directory -start-insert -buffer-name=cd -default-action=cd<CR>

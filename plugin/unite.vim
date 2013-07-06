" ctrl-p replacement --------------------------------------------
nno <leader>nrf :<C-u>Unite file_mru file_rec/async:! -start-insert -buffer-name=files<CR>
nno <leader>nf :<C-u>Unite file_rec file_rec/async:! -start-insert -buffer-name=files<CR>
nno <leader>nd :<C-u>Unite directory_mru directory -start-insert -buffer-name=cd -default-action=cd<CR>

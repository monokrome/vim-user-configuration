" Fugitive! :D :D :D
noremap <leader>ss :Gstat<CR>
noremap <leader>sc :Gcommit<CR>
noremap <leader>sb :Gblame<CR>
noremap <leader>se :Gedit<CR>
noremap <leader>sw :Gwrite<CR>
noremap <leader>sB :Gbrowse<CR>
noremap <leader>sd :Gdiff<CR>

" Vim gitgutter
let g:gitgutter_enabled = 0

noremap <leader>sg :GitGutterToggle<CR>
noremap <leader>sG :GitGutterLineHighlightsToggle<CR>
noremap <leader>sh :GitGutterNextHunk<CR>
noremap <leader>sH :GitGutterNextHunk<CR>

" Dispatch! :D
noremap <leader>m :Dispatch<CR>
noremap <leader>M :Dispatch!<CR>
noremap <leader>sp :Dispatch git push<CR>
noremap <leader>su :Dispatch git pull<CR>
noremap <leader>sf :Dispatch git fetch<CR>

" Vundle!
noremap <leader>B :BundleInstall!<CR>

" Fugitive! :D :D :D
noremap <leader>ss :Gstat<CR>
noremap <leader>sc :Gcommit<CR>
noremap <leader>sb :Gblame<CR>
noremap <leader>se :Gedit<CR>
noremap <leader>sw :Gwrite<CR>
noremap <leader>sB :Gbrowse<CR>
noremap <leader>sd :Gdiff<CR>
noremap <leader>sp :Git push<CR>
noremap <leader>su :Git pull<CR>
noremap <leader>sf :Git fetch<CR>

" Vim gitgutter
let g:gitgutter_enabled = 0

noremap <leader>sg :GitGutterToggle<CR>
noremap <leader>sG :GitGutterLineHighlightsToggle<CR>
noremap <leader>sh :GitGutterNextHunk<CR>
noremap <leader>sH :GitGutterNextHunk<CR>

" Dispatch! :D
noremap <leader>m :Make<CR>
noremap <leader>M :Make!<CR>

" Vundle!
noremap <leader>B :BundleInstall!<CR>

" Syntastic!
let g:syntastic_always_populate_loc_list=1

" XPTemplate!
let g:xptemplate_snippet_filders=$HOME . '/.vimrc/bundle/vim-user-configuration/'

" Gist!
let g:gist_clip_comman = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

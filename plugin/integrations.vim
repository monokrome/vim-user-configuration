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

" Makeshift! :D
let s:build_path = finddir('.build', '.', 1)

if '' != s:build_path
  let g:makeshift_root=s:build_path
endif

" Dispatch! :D
noremap <leader>md :Dispatch<CR>
noremap <leader>mD :Dispatch!<CR>
noremap <leader>mm :Make<CR>
noremap <leader>mM :Make!<CR>

" Vundle!
noremap <leader>b :NeoBundleInstall<CR>
noremap <leader>B :NeoBundleInstall!<CR>

" Gist!
let g:gist_clip_comman = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" Syntastic!
let g:syntastic_always_populate_loc_list=1

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost "*.c,*.cpp,*.cxx,*.py,*.js,*.coffee" call s:syntastic()
augroup END

" Allow per-project settings!
function! s:apply_locals()
  let l:locals = findfile('Project.vim', '.')

  if filereadable(l:locals)
    exec ':source '.l:locals
  endif
endfunction

augroup AutoLocals
  autocmd!
  autocmd BufNewFile,BufRead,VimEnter * call s:apply_locals()
augroup END

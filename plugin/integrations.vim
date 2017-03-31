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

" Signify
let g:signify_disable_by_default = 1
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1
let g:signify_cursorhold_normal = 1
let g:signify_cursorhold_insert = 1

let g:signify_sign_add               = '+'
let g:signify_sign_change            = '~'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'

let g:signify_mapping_toggle = '<leader>sg'
let g:signify_mapping_toggle_highlight = '<leader>sG'
let g:signify_mapping_next_hunk = '<leader>sj'
let g:signify_mapping_prev_hunk = '<leader>sk'

" Makeshift! :D
let s:build_path = finddir('.build', '.', 1)

if '' != s:build_path
  let g:makeshift_root=s:build_path
endif

" Dispatch! :D
nnoremap <leader>md :Dispatch<CR>
nnoremap <leader>mD :Dispatch!<CR>
nnoremap <leader>mm :Make<CR>
nnoremap <leader>mM :Make!<CR>
nnoremap <leader>mc :Make clean<CR>
nnoremap <leader>mC :Make! clean<CR>

" Plug!
noremap <leader>b :PlugInstall<CR>
noremap <leader>B :PlugInstall!<CR>

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
  let l:locals = findfile('Project.vim', '.;')

  if filereadable(l:locals)
    exec ':source '.l:locals
  endif
endfunction

augroup AutoLocals
  autocmd!
  autocmd BufNewFile,BufRead,VimEnter * call s:apply_locals()
augroup END

" Append the current pivotal URL as "Finsihed" to the end of the document
nmap <leader>Tf G2] Gi[Finishes #] pvT/yF#p:nohl

" Go integrations!
let g:go_snippet_engine = 'ultisnips'

" Jump to Atom easily for pairing with others
nnoremap <leader>gE :execute '!atom "' . getcwd() . '" "' . expand("%") . '"'<CR>

" Fugitive! :D :D :D
noremap <leader>sB :GBrowse<CR>
noremap <leader>sb :Git blame<CR>
noremap <leader>sc :Git commit<CR>
noremap <leader>sd :Gdiff<CR>
noremap <leader>se :Gedit<CR>
noremap <leader>sf :Git fetch<CR>
noremap <leader>sp :Git push<CR>
noremap <leader>ss :Git<CR>
noremap <leader>su :Git pull<CR>
noremap <leader>sw :Gwrite<CR>

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

" Ale
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

let g:ale_fixers = {
\   '*': [
\     'remove_trailing_lines',
\     'trim_whitespace',
\   ],
\ }

" Go
let g:go_version_warning = 0  " stfu

" Deno
let g:markdown_fenced_languages = ["ts=typescript"]

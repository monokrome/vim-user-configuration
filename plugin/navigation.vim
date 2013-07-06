" j/k make a lot more sense this way when lines are wrapped 
nmap j gj
nmap k gk

" Show ctrl-p at the top of the screen
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 1

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }

" Show tagbar of current symbols with <leader>s
noremap <leader>Ss :TagbarToggle<CR>
noremap <leader>Sf :TagbarTogglePause<CR>

" Multi-cursor bindings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<leader>j'
let g:multi_cursor_prev_key='<leader>k'
let g:multi_cursor_skip_key='<leader>x'
let g:multi_cursor_quit_key='<Esc>'

" Use tabs by default, instead of separate windows.
tab all

" Show matching brace highlights
set showmatch

" Always show the ruler for information about the current file
set ruler

" Better tab completion
set wildmode=longest:full
set wildmenu

" Defualt to not have any folds
set foldlevelstart=99

" Disable warnings about files having been changed when switching
" to new ones.
set hidden

" Disable line numbers (they are enabled by python-mode)
set nonumber

" Show me the jumplist
noremap <leader>lj :jumps<CR>
noremap <leader>lc :changes<CR>

let g:unite_source_history_yank_enable = 1

" ctrl-p replacement
nno <leader>nrf :<C-u>Unite file_mru file_rec/async:! -start-insert<CR>
nno <leader>nf :<C-u>Unite file_rec file_rec/async:! -start-insert<CR>

" Change to recently used directories
nno <leader>nd :<C-u>Unite directory_mru directory -start-insert -buffer-name=cd -default-action=cd<CR>

" MacVim / GVim stuff.
if has('gui_running')
  noremap <D-,> :e ~/.vimrc<CR>
endif


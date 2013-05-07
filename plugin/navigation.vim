" j/k make a lot more sense this way when lines are wrapped 
nmap j gj
nmap k gk

" Show ctrl-p at the top of the screen
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

" Show tagbar of current symbols with <leader>s
noremap <leader>S :TagbarTogglePause<CR>

" Multi-cursor bindings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<leader>j'
let g:multi_cursor_prev_key='<leader>k'
let g:multi_cursor_skip_key='<leader>x'
let g:multi_cursor_quit_key='<Esc>'

" YouCompleteMe navigation
noremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Relative line numbers
set rnu


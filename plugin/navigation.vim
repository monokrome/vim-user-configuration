" j/k make a lot more sense this way when lines are wrapped 
nmap j gj
nmap k gk

" Show ctrl-p at the top of the screen
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0

" Show tagbar of current symbols with <leader>s
noremap <leader>s :TagbarToggle<CR>

" Multi-cursor bindings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" YouCompleteMe navigation
let g:ycm_register_as_syntastic_checker = 1
noremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


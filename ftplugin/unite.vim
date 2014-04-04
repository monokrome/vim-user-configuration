inoremap <buffer> <TAB> <Plug>(unite_select_next_line)

inoremap <buffer> ' <Plug>(unite_quick_match_default_action)
nnoremap <buffer> ' <Plug>(unite_quick_match_default_action)

nnoremap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
inoremap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)

inoremap <buffer> <C-y>     <Plug>(unite_narrowing_path)
nnoremap <buffer> <C-y>     <Plug>(unite_narrowing_path)

nnoremap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)

nnoremap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
inoremap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)

nnoremap <silent><buffer><expr> l unite#smart_map('l', unite#do_action('default'))

let unite = unite#get_current_unite()

if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r unite#do_action('replace')
else
        nnoremap <silent><buffer><expr> r unite#do_action('rename')
endif

nnoremap <silent><buffer><expr> cd unite#do_action('lcd')

nnoremap <buffer><expr> S unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ?
        \ ['sorter_reverse'] : [])

inoremap <silent><buffer><expr> <C-s> unite#do_action('split')

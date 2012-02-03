autocmd FileType python        set omnifunc=pythoncomplete#Complete
autocmd FileType python        set expandtab
autocmd FileType python        set shiftwidth=4
autocmd FileType python        set tabstop=4
autocmd FileType python        set autoindent

" Execute Python code upon pressing Control+M
autocmd FileType python        map <buffer> <C-M> :w<CR>:!clear && /usr/bin/env python % <CR>


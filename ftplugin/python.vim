setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab

setlocal foldmethod=indent
setlocal commentstring=#\ %s

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>:nohlsearch<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>:nohlsearch<CR>

" Go to definitions using vim-jedi
noremap <buffer> gd :call jedi#goto_assignments()<CR>
noremap <buffer> gD :call jedi#goto_definitions()<CR>

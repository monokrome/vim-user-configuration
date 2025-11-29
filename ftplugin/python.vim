setlocal softtabstop=4
setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab

setlocal foldmethod=indent
setlocal commentstring=#\ %s

" Define sections by classes
noremap <buffer> [[ ?^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>:nohlsearch<CR>
noremap <buffer> ]] /^\(\%^\<bar>\n\n\s*\)\zs\S\<bar>^\zsclass<CR>:nohlsearch<CR>

" Ale (buffer-local settings)
let b:ale_fixers = ['yapf']
let b:ale_linters = ['flake8']

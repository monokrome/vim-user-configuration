" Fix backspace on Windows machines.
set backspace=2

" Key map 't' to creating a new tab
nmap t :tabnew<Enter>

" Run make with F7, clean with F8
map <F7> :make<CR>
map <S-F7> :make clean<CR>

" Remove trailing whitespace with ,dw
nnoremap <leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

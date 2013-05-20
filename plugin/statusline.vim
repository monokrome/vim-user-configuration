" Set statusline to empty
set statusline=

" Add the fype
set statusline+=%h%m%r%y\ 

" Add filename to statusline
set statusline+=%f

" Everything after this is right-aligned
set statusline+=%=

" Add current line information
set statusline+=%c,%l/%L\ 

" Current list type
set statusline+=%q\ 

" Add git information to the status line from fugitive
set statusline+=%{fugitive#statusline()}


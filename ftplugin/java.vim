setlocal noexpandtab
setlocal list
setlocal listchars=tab:+\ ,eol:-
setlocal formatprg=par\ -w80\ -T4
setlocal omnifunc=javacomplete#Complete

" Smart import with F5
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)

" Add all class imports with F5
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" Add all missing imports with F6
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" Clean up missing imports with F7
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


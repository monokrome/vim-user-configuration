let b:sessions_root = $HOME . '/.vim/tmp/sessions'

function! UpdateSessionPaths()
  let b:session_directory = b:sessions_root . getcwd()
  let b:session_filename = b:session_directory . '/Session.vim'
endfunction 

function! SaveSession()
  call UpdateSessionPaths()

  if (filewritable(b:session_directory) != 2)
    execute 'silent !mkdir -p ' b:session_directory
    redraw!
  endif

  execute 'mksession! ' . b:session_filename
endfunction

function! LoadSession()
  call UpdateSessionPaths()

  if (filereadable(b:session_filename))
    execute 'source ' b:session_filename
  else
    echo 'No session loaded.'
  endif
endfunction

autocmd VimEnter * nested :call LoadSession()
autocmd VimLeave * :call SaveSession()


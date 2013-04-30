function! LoadSession()
  if argc() > 0
    return
  endif

  let b:sessions_root = $HOME . '/.vim/tmp/sessions'
  let b:session_directory = b:sessions_root . getcwd()
  let b:session_filename = b:session_directory . '/Session.vim'

  if filereadable(b:session_filename)
    execute 'source ' b:session_filename
  else
    if !isdirectory(b:session_directory) && !filereadable(b:session_directory)
      call mkdir(b:session_directory, 'p')
    endif

    execute 'Obsession ' b:session_filename
  endif
endfunction

autocmd VimEnter * nested :call LoadSession()


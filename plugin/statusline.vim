function! ModifiedStatus()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! ReadOnlyStatus()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "RO"
  else
    return ""
  endif
endfunction

function! FugitiveStatus()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

let g:lightline = {
  \    'colorscheme': 'solarized',
  \    'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \    'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \    'component_function': {
  \      'readonly': 'ReadOnlyStatus',
  \      'modified': 'ModifiedStatus',
  \      'fugitive': 'FugitiveStatus'
  \    },
  \    'active': {
  \      'left': [
  \        [ 'mode', 'paste' ],
  \        [ 'readonly', 'filename', 'modified' ],
  \        [ 'fugitive' ]
  \      ]
  \    }
  \  }

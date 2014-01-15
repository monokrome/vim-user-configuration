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
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! FugitiveStatus()
  if exists('*fugitive#head')
    let head = fugitive#head()
    return strlen(head) ? "\ue0a0 " . head : ''
  endif
endfunction

function! FileTypeStatus()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! FileStatus()
  return ('' != ReadOnlyStatus() ? ReadOnlyStatus() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '') .
       \ ('' != FileTypeStatus() ? ' [' . FileTypeStatus() . ']' : '') .
       \ ('' != ModifiedStatus() ? ' ' . ModifiedStatus() : '')
endfunction


let g:lightline = {
  \    'colorscheme': 'solarized',
  \    'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \    'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \    'component_function': {
  \      'readonly': 'ReadOnlyStatus',
  \      'modified': 'ModifiedStatus',
  \      'fugitive': 'FugitiveStatus',
  \      'filename': 'FileStatus'
  \    },
  \    'active': {
  \      'left': [
  \        ['mode', 'paste'],
  \        ['fugitive', 'filename']
  \      ]
  \    }
  \  }

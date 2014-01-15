function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

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
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let head = fugitive#head()
      return strlen(head) ? "\ue0a0 " . head : ''
    endif
  catch
  endtry

  return ''
endfunction

function! FileTypeStatus()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! FileFormatStatus()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! FileEncodingStatus()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! FileNameStatus()
  return ('' != ReadOnlyStatus() ? ReadOnlyStatus() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '') .
       \ ('' != ModifiedStatus() ? ' ' . ModifiedStatus() : '')
endfunction

function! ModeStatus()
  let fname = expand('%:t')

  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction


let g:lightline = {
  \    'colorscheme': 'solarized',
  \    'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \    'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \    'component_function': {
  \      'readonly': 'ReadOnlyStatus',
  \      'modified': 'ModifiedStatus',
  \      'fugitive': 'FugitiveStatus',
  \      'filename': 'FileNameStatus',
  \      'filetype': 'FileTypeStatus',
  \      'fileformat': 'FileFormatStatus',
  \      'fileencoding': 'FileEncodingStatus',
  \      'mode': 'ModeStatus'
  \    },
  \    'component_expand': {
  \      'syntastic': 'SyntasticStatuslineFlag'
  \    },
  \    'component_type': {
  \      'syntastic': 'error',
  \    },
  \    'active': {
  \      'left': [
  \        ['mode', 'paste'],
  \        ['fugitive', 'filename']
  \      ],
  \      'right': [
  \        ['syntastic', 'lineinfo'],
  \        ['percent'],
  \        ['fileformat', 'fileencoding', 'filetype']
  \      ]
  \    }
  \  }



let g:tagbar_status_func = 'TagbarStatusFunc'

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

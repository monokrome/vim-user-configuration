let g:lightline = {
  \    'colorscheme': 'solarized',
  \    'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \    'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \    'component': {
  \      'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \      'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \      'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \    },
  \    "component_visible_condition": {
  \      'readonly': '(&filetype!="help"&& &readonly)',
  \      'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \      'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \    },
  \    'active': {
  \      'left': [
  \        [ 'mode', 'paste' ],
  \        [ 'readonly', 'filename', 'modified' ],
  \        [ 'fugitive' ]
  \      ]
  \    }
  \  }

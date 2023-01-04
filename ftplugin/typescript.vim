" Use prettier-eslint for linting and fixing code
let g:ale_javascript_prettier_use_local_config = 1

let b:ale_linters = {
\   'typescript': [
\     'prettier',
\     'eslint',
\     'tsserver',
\   ],
\ }

let b:ale_fixers = {
\   'typescript': [
\     'prettier',
\     'eslint',
\   ],
\ }

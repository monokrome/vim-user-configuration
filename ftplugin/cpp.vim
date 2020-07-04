noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

setlocal shiftwidth=4
setlocal tabstop=4
setlocal noexpandtab
setlocal list

let b:ale_fixers = ['clang-format']

setlocal includeexpr='include/'.v:fname

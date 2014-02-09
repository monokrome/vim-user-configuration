noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

setlocal noexpandtab
setlocal list

setlocal includeexpr='include/'.v:fname

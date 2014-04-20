noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

setlocal tabstop=4
setlocal noexpandtab
setlocal list

setlocal includeexpr='include/'.v:fname

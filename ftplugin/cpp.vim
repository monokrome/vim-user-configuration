noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

setlocal shiftwidth=4
setlocal tabstop=4
setlocal noexpandtab
setlocal list

setlocal includeexpr='include/'.v:fname

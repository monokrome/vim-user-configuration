setlocal shiftwidth=2
setlocal tabstop=2
setlocal noexpandtab
setlocal list

setlocal includeexpr='include/'.v:fname

noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>


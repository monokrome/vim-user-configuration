let g:syntastic_cpp_compiler_options = ' -std=c++11 -pedantic -Wall -Werror -Weffc++ -Wextra -Wmain -Wshadow'


noremap <buffer> gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

setlocal shiftwidth=4
setlocal tabstop=4
setlocal noexpandtab
setlocal list

setlocal includeexpr='include/'.v:fname

" j/k make a lot more sense this way when lines are wrapped
nnoremap j gj
nnoremap k gk

" vim-sneak configuration
let g:sneak#label = 1           " EasyMotion-like labels
let g:sneak#use_ic_scs = 1      " Case insensitive (respects ignorecase/smartcase)
let g:sneak#s_next = 1          " s/S to go to next/prev match after sneak

" Telescope bindings for finding files
nnoremap <leader>nf <cmd>Telescope find_files<CR>
nnoremap <C-p> <cmd>Telescope find_files<CR>
nnoremap <leader>ng <cmd>Telescope live_grep<CR>
nnoremap <leader>nh <cmd>Telescope help_tags<CR>

" vim-visual-multi bindings (replaces vim-multi-cursor)
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<leader>j'
let g:VM_maps['Find Subword Under'] = '<leader>j'
let g:VM_maps['Skip Region'] = '<leader>x'
let g:VM_maps['Remove Region'] = '<leader>X'
let g:VM_maps['Select All'] = '<leader>A'
let g:VM_maps['Add Cursor Down'] = '<C-j>'
let g:VM_maps['Add Cursor Up'] = '<C-k>'
let g:VM_leader = '\\'

" Use tabs by default, instead of separate windows.
tab all

" Show matching brace highlights
set showmatch

" Always show the ruler for information about the current file
set ruler

" Better tab completion
set wildmode=longest:full
set wildmenu

" Folding configuration
set foldlevelstart=99
set foldmethod=syntax

let g:vim_markdown_initial_foldlevel=9

nnoremap <space> za

" Disable warnings about files having been changed when switching
" to new ones.
set hidden

" Disable line numbers (they are enabled by python-mode)
set nonumber

" Show me the jumplist
noremap <leader>lj :jumps<CR>
noremap <leader>lc :changes<CR>

" Telescope: registers/yank history
nnoremap <leader>ny <cmd>Telescope registers<CR>

" Telescope: buffer list
nnoremap <leader>nb <cmd>Telescope buffers<CR>

" Telescope: recent files
nnoremap <leader>no <cmd>Telescope oldfiles<CR>

" Telescope: symbols/tags
nnoremap <leader>nt <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>nT <cmd>Telescope tags<CR>
nnoremap <leader>ns <cmd>Telescope treesitter<CR>

" Telescope: LSP
nnoremap <leader>nR <cmd>Telescope lsp_references<CR>
nnoremap <leader>ni <cmd>Telescope lsp_implementations<CR>
nnoremap <leader>nD <cmd>Telescope lsp_definitions<CR>

" Telescope: diagnostics
nnoremap <leader>nd <cmd>Telescope diagnostics<CR>
nnoremap <leader>nq <cmd>Telescope quickfix<CR>

" Telescope: git
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gC <cmd>Telescope git_bcommits<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>
nnoremap <leader>gs <cmd>Telescope git_status<CR>
nnoremap <leader>gS <cmd>Telescope git_stash<CR>

" Telescope: misc
nnoremap <leader>n/ <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>nc <cmd>Telescope commands<CR>
nnoremap <leader>nm <cmd>Telescope marks<CR>
nnoremap <leader>nk <cmd>Telescope keymaps<CR>
nnoremap <leader>n: <cmd>Telescope command_history<CR>
nnoremap <leader>n. <cmd>Telescope resume<CR>

" MacVim / GVim stuff.
if has('gui_running')
  noremap <D-,> :e ~/.vimrc<CR>
endif

" Find ctags binary
let s:ctags_bin = findfile(
  \    'ctags',
  \    $HOME . '/bin;' .  $HOME . '/.config/homebrew;/usr/local/bin;/usr/bin;/bin',
  \    1
  \ )

if ('' != s:ctags_bin)
  let g:tagbar_ctags_bin = s:ctags_bin
endif

" Jump to and re-source vimrc files easily.
if exists('$MYVIMRC')
  nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
  nnoremap <silent> <leader>esv :so $MYVIMRC<cr>
  nnoremap <silent> <leader>eu :e $VIM/bundle/vim-user-configuration<cr>
endif

if has('autocmd')
  " Clear the signs column
  autocmd VimEnter * highlight clear SignColumn
endif

" Vim-asterisk
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

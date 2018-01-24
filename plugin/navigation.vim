" j/k make a lot more sense this way when lines are wrapped 
nnoremap j gj
nnoremap k gk

" Use FZF for finding files
nnoremap <leader>nf :FZF<CR>
nnoremap <C-p> :FZF<CR>

" Multi-cursor bindings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<leader>j'
let g:multi_cursor_prev_key='<leader>k'
let g:multi_cursor_skip_key='<leader>x'
let g:multi_cursor_quit_key='<Esc>'

" Use tabs by default, instead of separate windows.
tab all

" Show matching brace highlights
set showmatch

" Always show the ruler for information about the current file
set ruler

" Better tab completion
set wildmode=longest:full
set wildmenu

" Default to not have any folds
set foldlevelstart=99
set foldmethod=marker

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

" Yank history
nnoremap <leader>ny :Unite history/yank<CR>

" A bit like lusty-juggler
nnoremap <leader>nb :Unite buffer -quick-match<CR>

" Change to recently used directories
nno <leader>nd :Unite directory_mru directory -start-insert -buffer-name=cd -default-action=cd<CR>

" Tagbar-like tool
nnoremap <leader>nt :Unite outline -start-insert<CR>
nnoremap <leader>nT :Unite tag -start-insert<CR>

" MacVim / GVim stuff.
if has('gui_running')
  noremap <D-,> :e ~/.vimrc<CR>
endif

" Open help winodws in vertical splits
cnorea h tab help
cnorea vh vert help
cnorea hh help

" Find ctags binary
let s:ctags_bin = findfile(
  \    'ctags',
  \    $HOME . '/bin;' .  $HOME . '/.config/homebrew;/usr/local/bin;/usr/bin;/bin',
  \    1
  \ )

if ('' != s:ctags_bin)
  let g:tagbar_ctags_bin=''
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

  augroup unite
    " Use unite-tag to jump to tags
    autocmd BufEnter *
      \   if empty(&buftype)
      \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
      \|  endif
  augroup END
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

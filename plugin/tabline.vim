function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufferFilename = bufname(buflist[winnr - 1])
  return expand(bufferFilename, 'h')
endfunction

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T'
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction

set tabline=%!MyTabLine()

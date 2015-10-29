
function! s:HandleURL()
  let l:uri = matchstr(getline("."), "https\\?://[^ ]*")
  if l:uri != ""
    call system("open " . shellescape(l:uri))
  endif
endfunction

function! s:ToggleBox()
  let l:cline = getline(".")
  if match(l:cline, "^ \*\\[ \\]") != -1
    normal! ^lrx
  elseif match(l:cline, "^ \*\\[.\\]") != -1
    execute "normal! ^lr "
  end
  " not a box line -- don't toggle
  normal! j
  " position cursor in the box, if there is one
  if match(l:cline, "^ \*\\[.\\]") != -1
    normal! ^l
  end
endfunction

nnoremap <buffer> <CR> :call <SID>ToggleBox()<CR>
vnoremap <buffer> <CR> :call <SID>HandleURL()<CR>

" 0lrx -- add a checkmark
" f_c$ -- skip to _, delete
" ^x^l -- line-complete from above
TabMacro '___', '0lrxf_c$'


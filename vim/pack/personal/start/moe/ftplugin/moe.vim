
function! s:ToggleBox()
  let l:cline = getline(".")
  if match(l:cline, "^ \*\\[ \\]") != -1
    normal! ^lrx
    " try to replace '___' with line completion from above
    if match(l:cline, " ___$") != -1
      execute "normal $hhc$"
    end
  elseif match(l:cline, "^ \*\\[.\\]") != -1
    execute "normal! ^lr "
  end
  " move down
  normal! j
  " position cursor in the box, if there is one
  if match(l:cline, "^ \*\\[.\\]") != -1
    normal! ^l
  end
endfunction

nnoremap <buffer> <CR> :call <SID>ToggleBox()<CR>

" -------------------------------------------------

function! FormatMoe(buffer) abort
  return {'command': 'moefix'}
endfunction

execute ale#fix#registry#Add('moefix', 'FormatMoe', ['moe'], 'Fix moe with moefix')

" -------------------------------------------------

let b:ale_fixers = ['moefix']

setlocal nonumber


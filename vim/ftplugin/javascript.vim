
let b:ale_fixers = ['prettier']

" -------------------------------------------------

function! s:searchLocal()
  silent! grep -i '^ *(describe\|beforeEach\|it)\(' %
  redraw!
  copen
endfunction

nnoremap <buffer> ,. :call <SID>searchLocal()<CR>


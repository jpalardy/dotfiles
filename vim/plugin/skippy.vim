
function! SkipUpWhile(pattern)
  if strlen(a:pattern) == 0
    return
  endif

  while line(".") > 1
    if stridx(getline("."), a:pattern) != 0
      break
    endif

    normal k
  endwhile
endfunction

function! SkipDownWhile(pattern)
  if strlen(a:pattern) == 0
    return
  endif

  while line(".") < line("$")
    if stridx(getline("."), a:pattern) != 0
      break
    endif

    normal j
  endwhile
endfunction

nmap <leader>k v0y:call SkipUpWhile(@0)<CR>
nmap <leader>j v0y:call SkipDownWhile(@0)<CR>

vmap <leader>k   y:call SkipUpWhile(@0)<CR>
vmap <leader>j   y:call SkipDownWhile(@0)<CR>


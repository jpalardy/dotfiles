
function! TabMacro(key, value)
  if !exists("b:tabmacros")
    let b:tabmacros = {}
  endif
  let b:tabmacros[a:key] = a:value
endfunction
command -nargs=* TabMacro :call TabMacro(<args>)

function! TabMacroify()
  let line = getline('.')
  for [key, value] in items(b:tabmacros)
    if match(line, key) != -1
      execute "normal! " . b:tabmacros[key]
      return
    endif
  endfor
endfunction

nnoremap <TAB> :call TabMacroify()<CR>



vmap <buffer> <leader>e !csv2par<CR>
vmap <buffer> <leader>i !par2csv<CR>

vmap <buffer> <leader>r !csv2par \| tac \| par2csv<CR>

if !exists("b:snippets")
  let b:snippets = {}
endif

function Snippet_later(time)
  return substitute(system("later 5"), "\n", "", "")
endfunction

let b:snippets["later"] = function("Snippet_later")


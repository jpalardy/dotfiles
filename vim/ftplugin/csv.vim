
let b:quickCheckCmd = "csvlint"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("b:snippets")
  let b:snippets = {}
endif

function Snippet_later(time)
  return strftime("%F", localtime() + system("shuf -n1 -i 1-5") * 86400)
endfunction

let b:snippets["later"] = function("Snippet_later")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <buffer> <leader>e !csv2par<CR>
vmap <buffer> <leader>i !par2csv<CR>

vmap <buffer> <leader>r !csv2par \| tac \| par2csv<CR>



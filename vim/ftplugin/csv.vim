
let b:quickCheckCmd = "csvlint"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <buffer> <leader>e !csv2par<CR>
vmap <buffer> <leader>i !par2csv<CR>

vmap <buffer> <leader>r !csv2par \| tac \| par2csv \| tac<CR>

nmap <buffer> <F3> :!forgetful -t -d 1..4 %<CR>


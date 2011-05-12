
function! FixSQLSemicolon(sql)
  return substitute(a:sql,";*\n*$",';','g')
endfunction

" pretty-print
nmap <leader>pp vip<leader>pp
vmap <leader>pp !sqlpp<CR>

" expand
nmap <leader>e vip<leader>e
vmap <leader>e !sqlexpand<CR>


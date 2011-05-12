
function! FixSQLSemicolon(sql)
  return substitute(a:sql,";*\n*$",';','g')
endfunction

nmap ,pp vip,pp
vmap ,pp !sqlpp<CR>


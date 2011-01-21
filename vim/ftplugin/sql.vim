
function! FixSQLSemicolon(sql)
  return substitute(a:sql,";*\n*$",';','g')
endfunction


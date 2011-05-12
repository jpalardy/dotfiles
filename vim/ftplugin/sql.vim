
function! FixSQLSemicolon(sql)
  return substitute(a:sql,";*\n*$",';','g')
endfunction

nmap ,pp vip,pp
vmap ,pp !sqlpp<CR>

"-------------------------------------------------

if !exists("b:snippets")
  let b:snippets = {}
endif

function! Snippet_frequency_table(text)
  let l:table  = input("table: ")
  let l:column = input("column: ")

  return "SELECT " . l:column . ", COUNT(*) FROM " . l:table . " GROUP BY " . l:column . " ORDER BY " . l:column
endfunction

let b:snippets["ft"] = function("Snippet_frequency_table")


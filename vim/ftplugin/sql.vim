
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Snippet_column_histogram(text)
  let l:column = input("column: ")
  let l:table  = input("table: ")

  return "SELECT " . l:column . ", COUNT(*) FROM " . l:table . " GROUP BY " . l:column . " ORDER BY " . l:column
endfunction

let g:snippets["histogram"] = function("Snippet_column_histogram")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


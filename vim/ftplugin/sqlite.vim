
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> :call SQLITE_ScratchyQuery("raw")<CR>
nmap <buffer> <F3> :call SQLITE_ScratchyQuery("horizontal")<CR>
nmap <buffer> <F4> :call SQLITE_ScratchyQuery("vertical")<CR>

" EXPLAIN
nmap <buffer> ,e :call SQLITE_ScratchyQuery("explain")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SQLITE_ScratchyQuery(type)
  normal yip
  let l:query = expand(@0) . ";"

  if a:type == "explain"
    let l:query= "explain " . l:query
  end

  let l:query=substitute(l:query, "\n", ' ', 'g')
  let l:query=substitute(l:query, "'", "'\\\\''", "g")

  if !exists("b:db_config")
    call SQLITE_Database_Vars()
  end

  let l:filename = " " . b:db_config["filename"]
  let l:flags = "-header -nullvalue null " . {"raw": "", "horizontal": "-column", "vertical": "-line", "explain": "-column"}[a:type]

  SplitScratchy "echo '" . l:query . "' | sqlite3 " . l:flags . l:filename
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SQLITE_Database_Vars()
  if !exists("b:db_config")
    let b:db_config = {"filename": $DB_FILENAME}
  end

  let b:db_config["filename"] = input("database: ", b:db_config["filename"], "file")
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


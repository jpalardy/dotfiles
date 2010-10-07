
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> yip:call SQLITE_Scratchy_raw(@0)<CR>
nmap <buffer> <F3> yip:call SQLITE_Scratchy_horizontal(@0)<CR>
nmap <buffer> <F4> yip:call SQLITE_Scratchy_vertical(@0)<CR>

" EXPLAIN
nmap <buffer> ,e   yip:call SQLITE_Scratchy_explain(@0)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SQLITE_Scratchy(flags, sql)
  if !exists("b:db_config")
    let b:db_config = {"filename": $DB_FILENAME}

    let b:db_config["filename"] = input("database: ", b:db_config["filename"], "file")
  end

  let flags = "-header -nullvalue null"
  let command = join(["sqlite3", flags, a:flags, b:db_config["filename"]], " ")
  let sql = a:sql . ";"

  SplitScratchy command, sql
endfunction

function! SQLITE_Scratchy_raw(sql)
  call SQLITE_Scratchy("", a:sql)
endfunction

function! SQLITE_Scratchy_horizontal(sql)
  call SQLITE_Scratchy("-column", a:sql)
endfunction

function! SQLITE_Scratchy_vertical(sql)
  call SQLITE_Scratchy("-line", a:sql)
endfunction

function! SQLITE_Scratchy_explain(sql)
  call SQLITE_Scratchy("-column", "explain query plan\n" . a:sql)
endfunction


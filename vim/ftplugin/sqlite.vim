
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> yip:call SQLITE_Scratchy("",        @0)<CR>
nmap <buffer> <F3> yip:call SQLITE_Scratchy("-column", @0)<CR>
nmap <buffer> <F4> yip:call SQLITE_Scratchy("-line",   @0)<CR>

" EXPLAIN
nmap <buffer> ,e   yip:call SQLITE_Scratchy("-column", "explain query plan\\n" . @0)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SQLITE_Scratchy(flags, sql)
  if !exists("b:db_config")
    let b:db_config = {"filename": $DB_FILENAME}

    let b:db_config["filename"] = input("database: ", b:db_config["filename"], "file")
  end

  let flags = "-header -nullvalue null"
  let command = join(["sqlite3", flags, a:flags, b:db_config["filename"]], " ")
  let sql = FixSQLSemicolon(a:sql)

  SplitScratchy command, sql
  exe "normal \<c-w>\<c-w>"
endfunction


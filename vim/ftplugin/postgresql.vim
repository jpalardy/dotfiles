
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> yip:call POSTGRESQL_Scratchy("-A -F'	'", @0)<CR>
nmap <buffer> <F3> yip:call POSTGRESQL_Scratchy("",         @0)<CR>
nmap <buffer> <F4> yip:call POSTGRESQL_Scratchy("-x",       @0)<CR>

" EXPLAIN
nmap <buffer> ,e   yip:call POSTGRESQL_Scratchy("", "explain\\n" . @0)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! POSTGRESQL_Scratchy(flags, sql)
  if !exists("b:db_config")
    let b:db_config = {"host": $DB_HOST, "name": $DB_NAME, "user": $DB_USER}

    let b:db_config["host"]     = input("host: ",     b:db_config["host"])
    let b:db_config["name"]     = input("database: ", b:db_config["name"])
    let b:db_config["user"]     = input("name: ",     b:db_config["user"])
  end

  let host = "-h " . b:db_config["host"]
  let name = "-d " . b:db_config["name"]
  let user = "-U " . b:db_config["user"]

  let flags = ""
  let command = join(["psql", flags, a:flags, host, user, name], " ")
  let sql = FixSQLSemicolon(a:sql)

  SplitScratchy command, sql
  exe "normal \<c-w>\<c-w>"
endfunction


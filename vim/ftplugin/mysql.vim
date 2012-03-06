
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> yip:call MYSQL_Scratchy("",           @0)<CR>
nmap <buffer> <F3> yip:call MYSQL_Scratchy("--table",    @0)<CR>
nmap <buffer> <F4> yip:call MYSQL_Scratchy("--vertical", @0)<CR>

" EXPLAIN
nmap <buffer> ,e   yip:call MYSQL_Scratchy("--table",    "explain\\n" . @0)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! MYSQL_Scratchy(flags, sql)
  if !exists("b:db_config")
    let b:db_config = {"host": $DB_HOST, "port": $DB_PORT, "name": $DB_NAME, "user": $DB_USER}

    let b:db_config["host"]     = input("host: ",     b:db_config["host"])
    let b:db_config["port"]     = input("port: ",     b:db_config["port"])
    let b:db_config["name"]     = input("database: ", b:db_config["name"])
    let b:db_config["user"]     = input("name: ",     b:db_config["user"])
    let b:db_config["password"] = inputsecret("password: ")
  end

  let host = "-h " . b:db_config["host"]
  let port = "-P " . b:db_config["port"]
  let name = b:db_config["name"]

  let user = "-u " . b:db_config["user"]
  let password = ""
  if b:db_config["password"] != ""
    let password = "-p" . b:db_config["password"]
  end

  let flags = "--default-character-set=utf8 -A"
  let command = join(["mysql", flags, a:flags, host, port, user, password, name], " ")
  let sql = FixSQLSemicolon(a:sql)

  SplitScratchy command, sql
  exe "normal \<c-w>\<c-w>"
endfunction


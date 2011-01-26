
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F3> yip:call ORACLE_Scratchy("", @0)<CR>

" EXPLAIN
nmap <buffer> ,e   yip:call ORACLE_Scratchy("", "explain plan for\\n" . @0)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! ORACLE_Scratchy(flags, sql)
  if !exists("b:db_config")
    let b:db_config = {"host": $DB_HOST, "name": $DB_NAME, "user": $DB_USER}

    let b:db_config["host"]     = input("host: ",     b:db_config["host"])
    let b:db_config["name"]     = input("database: ", b:db_config["name"])
    let b:db_config["user"]     = input("name: ",     b:db_config["user"])
    let b:db_config["password"] = inputsecret("password: ")
  end

  let host     = b:db_config["host"]
  let name     = b:db_config["name"]

  let user     = b:db_config["user"]
  let password = b:db_config["password"]

  let flags = "-S"
  let command = join(["sqlplus", flags, user . "/" . password . "@\\(DESCRIPTION=\\(ADDRESS=\\(PROTOCOL=TCP\\)\\(HOST=" . host . "\\)\\(PORT=1521\\)\\)\\(CONNECT_DATA=\\(SID=" . name . "\\)\\)\\)"], " ")
  let sql = FixSQLSemicolon(a:sql)
  let sql = ORACLE_add_settings(sql)

  SplitScratchy command, sql
  exe "normal \<c-w>\<c-w>"
endfunction

function! ORACLE_add_settings(sql)
  return join(["SET LINESIZE 32767","SET PAGESIZE 9999","SET FEEDBACK OFF","SET TAB OFF","",a:sql], "\n")
endfunction


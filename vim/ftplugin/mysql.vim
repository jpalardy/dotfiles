
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> :call MYSQL_ScratchyQuery("raw")<CR>
nmap <buffer> <F3> :call MYSQL_ScratchyQuery("horizontal")<CR>
nmap <buffer> <F4> :call MYSQL_ScratchyQuery("vertical")<CR>

" EXPLAIN
nmap <buffer> ,e :call MYSQL_ScratchyQuery("explain")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MYSQL_ScratchyQuery(type)
  normal yip
  let l:query = expand(@0)

  if a:type == "explain"
    let l:query= "explain " . l:query
  end

  let l:query=substitute(l:query, "\n", ' ', 'g')
  let l:query=substitute(l:query, "'", "'\\\\''", "g")

  if !exists("b:db_config")
    call MYSQL_Database_Vars()
  end

  let l:host = " -h " . b:db_config["host"]
  let l:user = " -u " . b:db_config["user"]
  let l:password = (b:db_config["password"] == "") ? "" : " -p " . b:db_config["password"]
  let l:name = " " . b:db_config["name"]
  let l:flags = "--default-character-set=utf8 " . {"raw": "", "horizontal": "--table", "vertical": "--vertical", "explain": "--table"}[a:type]

  SplitScratchy "echo '" . l:query . "' | mysql " . l:flags . l:host . l:user . l:password . l:name
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MYSQL_Database_Vars()
  if !exists("b:db_config")
    let b:db_config = {"host": $DB_HOST, "name": $DB_NAME, "user": $DB_USER, "password": ""}
  end

  let b:db_config["host"]     =       input("host: ",     b:db_config["host"])
  let b:db_config["name"]     =       input("database: ", b:db_config["name"])
  let b:db_config["user"]     =       input("username: ", b:db_config["user"])
  let b:db_config["password"] = inputsecret("password: ", b:db_config["password"])
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


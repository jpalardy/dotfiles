
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> :call MYSQL_ScratchQuery("", "")<CR>
nmap <buffer> <F3> :call MYSQL_ScratchQuery("--table", "")<CR>
nmap <buffer> <F4> :call MYSQL_ScratchQuery("--vertical", "")<CR>

" EXPLAIN
nmap <buffer> ,e :call MYSQL_ScratchQuery("--table", "explain")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MYSQL_ScratchQuery(type, prefix)
  normal yip
  let l:query = expand(@0)

  if a:prefix != ""
    let l:query=a:prefix . " " . l:query
  end

  let l:query=substitute(l:query, "\n", ' ', 'g')
  let l:query=substitute(l:query, "'", "'\\\\''", "g")

  if !exists("g:db_config")
    call MYSQL_Database_Vars()
  end

  Scratch "echo '" . l:query . "' | mysql --default-character-set=utf8 -h " . g:db_config["host"] . " -u " . g:db_config["user"] . " -p" . g:db_config["password"] . " " . a:type . " " . g:db_config["name"]
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MYSQL_Database_Vars()
  if !exists("g:db_config")
    let g:db_config = {"host": $DB_HOST, "name": $DB_NAME, "user": $DB_USER, "password": ""}
  end

  let g:db_config["host"]     =       input("host: ",     g:db_config["host"])
  let g:db_config["name"]     =       input("database: ", g:db_config["name"])
  let g:db_config["user"]     =       input("username: ", g:db_config["user"])
  let g:db_config["password"] = inputsecret("password: ", g:db_config["password"])
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


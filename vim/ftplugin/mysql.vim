
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

  if !exists("g:db_name") || !exists("g:db_user") || !exists("g:db_password")
    call MYSQL_Database_Vars()
  end

  Scratch "echo '" . l:query . "' | mysql -u " . g:db_user . " -p" . g:db_password . " " . a:type . " " . g:db_name
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MYSQL_Database_Vars()
  if !exists("g:db_name") || !exists("g:db_user") || !exists("g:db_password")
    let g:db_name     = $DB_NAME
    let g:db_user     = $DB_USER
    let g:db_password = ""
  end

  let g:db_name     = input("database: ", g:db_name)
  let g:db_user     = input("username: ", g:db_user)
  let g:db_password = inputsecret("password: ", g:db_password)
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


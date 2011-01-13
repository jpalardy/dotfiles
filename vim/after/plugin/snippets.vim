
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snippets["###"] = "############################################################"
let g:snippets["#--"] = "#-------------------------------------------------"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet_date(text)
  return substitute(strftime("%B %e, %Y"), " \\+", " ", "g")
endfunction

function Snippet_isod(time)
  return strftime("%F")
endfunction

let g:snippets["date"]  = function("Snippet_date")
let g:snippets["isod"]  = function("Snippet_isod")

let g:snippets["{$"]  = "{|}"
let g:snippets["{}$"] = "{|}"

let g:snippets["($"]  = "(|)"
let g:snippets["()$"]  = "(|)"

let g:snippets["[$"]  = "[|]"
let g:snippets["[]$"]  = "[|]"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


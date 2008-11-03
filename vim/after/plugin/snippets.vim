
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snippets["###"] = "############################################################"
let g:snippets["#--"] = "#-------------------------------------------------"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet_date(text)
  return Squeeze(strftime("%B %e, %Y"))
endfunction

function Datel(time)
  return Squeeze(strftime("%B %e, %Y (%A)", a:time))
endfunction

function Snippet_datel(text)
  return Datel(localtime())
endfunction

function Snippet_isod(time)
  return strftime("%F")
endfunction

let g:snippets["date"]  = function("Snippet_date")
let g:snippets["datel"] = function("Snippet_datel")
let g:snippets["isod"]  = function("Snippet_isod")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function Snippet_header(text)
  let l:header = " " . input("header: ") . " "

  return "#" . Center(l:header, 49, "-")
endfunction

let g:snippets["hdr"]  = function("Snippet_header")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


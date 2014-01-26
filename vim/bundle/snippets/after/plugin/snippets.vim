
let g:snippets["--$"]  = "-------------------------------------------------"

function Snippet_isod(time)
  return strftime("%F")
endfunction

let g:snippets["isod$"]  = function("Snippet_isod")


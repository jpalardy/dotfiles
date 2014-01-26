
function! Snippet_tag(text)
  let tag = substitute(a:text, "^<", "", "g")
  return "<" . tag . ">|</" . tag . ">"
endfunction

Snippet "<", function("Snippet_tag")


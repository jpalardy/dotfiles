
function! Snippet_tag(text)
  let tag = input("tag: ")
  return "<" . tag . ">|</" . tag . ">"
endfunction

Snippet "<", function("Snippet_tag")



nmap <buffer> <F3> :Scratch "ruby " . expand("%")<CR>

let ruby_space_errors = 1

let g:snippets["attr_a"] = "attr_accessor"
let g:snippets["attr_r"] = "attr_reader"
let g:snippets["attr_w"] = "attr_writer"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Snippet_erb_expr(text)
  let @y = "bhi"
  return "<%-  -%>"
endfunction

function! Snippet_erb_value(text)
  let @y = "bhi"
  return "<%=  %>"
endfunction

let g:snippets["<%-"] = function("Snippet_erb_expr")
let g:snippets["<%="] = function("Snippet_erb_value")


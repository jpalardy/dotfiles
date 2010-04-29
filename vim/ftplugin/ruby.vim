
let b:fileFilterCmd = "ruby"

let ruby_space_errors = 1

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

nmap <ESC>r      :SplitScratchy 'spec ' . expand("%")<CR>
vmap <ESC>r <ESC>:SplitScratchy 'spec ' . expand("%") . " -l " . line(".")<CR>


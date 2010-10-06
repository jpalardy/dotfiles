
let b:fileFilterCmd = "ruby"

let ruby_space_errors = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snippets["<%-"] = "<%- | -%>"
let g:snippets["<%="] = "<%= | %>"
let g:snippets["end"] = "<%- end -%>"

nmap <ESC>r      :SplitScratchy 'spec ' . expand("%")<CR>
vmap <ESC>r <ESC>:SplitScratchy 'spec ' . expand("%") . " -l " . line(".")<CR>

ab attr_a attr_accessor
ab attr_r attr_reader
ab attr_w attr_writer


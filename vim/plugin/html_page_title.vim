
function Html_page_title(text)
  rightbelow 3 split
  Scratchy "html_page_title " . a:text
endfunction

nmap <leader>? yiW:call Html_page_title(@")<CR>
vmap <leader>?   y:call Html_page_title(@")<CR>


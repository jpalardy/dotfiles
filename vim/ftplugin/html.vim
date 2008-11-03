source ~/.vim/ftplugin/xml.vim

" nmap <buffer> <F3> :%!tidy -q -asxml -indent --indent-spaces 2 -wrap 0 -clean --tidy-mark no --show-warnings no -utf8<CR>
" nmap <buffer> <F4> :%!xmllint --format --html -<CR>

nmap <buffer> <F3> :ScratchDiff("tidy -q -asxml -indent --indent-spaces 2 -wrap 0 -clean --tidy-mark no --show-warnings no -utf8 " . expand("%"))<CR>:set ft=html<CR>kdd<C-w><C-w>

function! HTML_css_tag(text)
  let l:filename = input("file: ")
  return "<link href=\"" . l:filename . "\" rel=\"stylesheet\" type=\"text/css\" />"
endfunction

function! HTML_js_tag(text)
  let l:filename = input("file: ")
  return "<script src=\"" . l:filename . "\" type=\"text/javascript\"> </script>"
endfunction

let g:snippets["css"] = function("HTML_css_tag")
let g:snippets["js"] = function("HTML_js_tag")


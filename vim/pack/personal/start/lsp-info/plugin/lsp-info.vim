
function! LSPInfo()
  let l:capabilities = {}
  for [conn_id, details] in items(ale#lsp#GetConnections())
    let l:capabilities[conn_id] = details.capabilities
  endfor
  vnew
  FPScratchy 'jq .', json_encode(l:capabilities)
  set ft=json
endfunction

command -nargs=* LSPInfo :call LSPInfo()


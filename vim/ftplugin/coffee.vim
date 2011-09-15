
if !exists("b:snippets")
  let b:snippets = {}
endif

" cycle JSON. -> JSON.stringify -> JSON.parse -> ...
let b:snippets['JSON.$']          = 'JSON.stringify'
let b:snippets['JSON.stringify$'] = 'JSON.parse'
let b:snippets['JSON.parse$']     = 'JSON.'


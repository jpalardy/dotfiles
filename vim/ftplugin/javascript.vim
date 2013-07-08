
if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets['fn'] = 'function'
let b:snippets['function'] = 'function () {|};'

let b:snippets['log'] = 'console.log(|);'
let b:snippets['for'] = 'for (var i = 0; i < |; i++) {}'

" cycle JSON. -> JSON.stringify -> JSON.parse -> ...
let b:snippets['JSON.$']          = 'JSON.stringify'
let b:snippets['JSON.stringify$'] = 'JSON.parse'
let b:snippets['JSON.parse$']     = 'JSON.'


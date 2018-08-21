
" helper for below
function! MultilineString(...)
  return join(a:000, "\n")
endfunction

" function definition
Snippet 'fn', 'function'
Snippet 'function', 'function |() {}'

Snippet 'fb', '=> {|}'
Snippet 'af', '() => {|}'

SnippetComplete "require", 'require("|");'

Snippet 'cl',  'console.log('
Snippet 'ce',  'console.error('
Snippet 'ce*', 'console.error("**** |"'

Snippet 'le', 'logger.error({|}, "CONTEXT");'

Snippet 'for', 'for (let i = 0; i < |; i += 1) {'
Snippet 'fe',  'forEach'

SnippetComplete 'JSON.stringify(|, null, 2)'

SnippetComplete 'prototype'
SnippetComplete 'hasOwnProperty'
SnippetComplete 'setTimeout'
SnippetComplete 'addEventListener'
SnippetComplete 'preventDefault'
SnippetComplete 'stopPropagation'

SnippetComplete 'eslint', MultilineString("/* eslint-disable no-console */",
                                        \ "/* eslint-disable func-names, prefer-arrow-callback */")


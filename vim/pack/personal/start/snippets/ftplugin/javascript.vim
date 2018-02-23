
" function definition
Snippet 'fn', 'function ('
" no arguments, block
Snippet '(', '() {|}'
" block after )
Snippet ')', ') {|}'

SnippetComplete "require", "require('|');"

Snippet 'cl',  'console.log('
Snippet 'ce',  'console.error('
Snippet 'ce*', "console.error('**** |', )"

Snippet 'for', 'for (var i = 0; i < |; i++) {}'
Snippet 'fe',  'forEach(function (|) {})'

SnippetComplete 'JSON.stringify('
Snippet         'JSON.stringify(', 'JSON.parse('
Snippet         'JSON.parse(',     'JSON.'

SnippetComplete 'prototype'
SnippetComplete 'hasOwnProperty'
SnippetComplete 'setTimeout'
SnippetComplete 'addEventListener'
SnippetComplete 'preventDefault'
SnippetComplete 'stopPropagation'

SnippetComplete 'eslint', '/* eslint no-console: 0, | */'


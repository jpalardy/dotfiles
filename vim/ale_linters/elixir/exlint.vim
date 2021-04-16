" Author: Jonathan Palardy - https://github.com/jpalardy
" Description: checking elixir files

call ale#linter#Define('elixir', {
\   'name': 'exlint',
\   'executable': 'exlint',
\   'command': 'exlint',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})


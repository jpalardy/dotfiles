" Author: Jonathan Palardy - https://github.com/jpalardy
" Description: checking moe files

call ale#linter#Define('moe', {
\   'name': 'moe',
\   'executable': 'moelint',
\   'command': 'moelint',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})


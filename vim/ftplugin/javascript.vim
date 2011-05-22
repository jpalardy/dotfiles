
setlocal makeprg=jslint\ %
setlocal errorformat=%-P%f,
                    \%-G/*jslint\ %.%#*/,
                    \%*[\ ]%n\ %l\\,%c:\ %m,
                    \%-G\ \ \ \ %.%#,
                    \%-GNo\ errors\ found.,
                    \%-Q

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets['fn'] = 'function'
let b:snippets['function'] = 'function() {}'


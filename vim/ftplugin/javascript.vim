
" require('x') --> var x = require('x') -- make var out of require
TabMacro '^require',    "^wwyiw^ivar \<esc>pa = "

" { x: 42 } --> {x: 42} -- delete outer space inside { }
TabMacro '{',           "^t}xT{x"


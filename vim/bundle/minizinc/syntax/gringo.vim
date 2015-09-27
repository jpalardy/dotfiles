if version < 600
   syntax clear
elseif exists("b:current_syntax")
  finish
endif

let b:current_syntax = ''
unlet b:current_syntax
syn include @Lua syntax/lua.vim

let b:current_syntax = ''
unlet b:current_syntax
syn include @Python syntax/python.vim

syn case match

syn match  gringoKeyword    "\*%"
syn match  gringoComment    +%.*+
syn region gringoBlockComment start="%\*" end="\*%"

syn match  gringoError          "#.*"

syn region luaCode          matchgroup=gringoKeyword start="#begin_lua" keepend end="#end_lua" contains=@Lua
syn region luaCode          matchgroup=gringoKeyword start="#script[ ]*([ ]*lua[ ]*)" keepend end="#end" contains=@Lua
syn region pythonCode       matchgroup=gringoKeyword start="#script[ ]*([ ]*python[ ]*)" keepend end="#end" contains=@Python
syn match  gringoKeyword    "#ishift"
syn match  gringoKeyword    "#base"
syn match  gringoKeyword    "#domain"
syn match  gringoKeyword    "#hide"
syn match  gringoKeyword    "#show"
syn match  gringoKeyword    "#cumulative"
syn match  gringoKeyword    "#volatile"
syn match  gringoKeyword    "#const"
syn match  gringoKeyword    "#include"
syn match  gringoKeyword    "#incremental"
syn match  gringoKeyword    "#sup"
syn match  gringoKeyword    "#inf"
syn match  gringoKeyword    "#supremum"
syn match  gringoKeyword    "#infimum"
syn match  gringoKeyword    "#undef"

syn match  gringoFunction   "#min"
syn match  gringoFunction   "#max"
syn match  gringoFunction   "#minimise"
syn match  gringoFunction   "#maximise"
syn match  gringoFunction   "#minimize"
syn match  gringoFunction   "#maximize"
syn match  gringoFunction   "#external"
syn match  gringoFunction   "#count"
syn match  gringoFunction   "#sum"
syn match  gringoFunction   "#times"
syn match  gringoFunction   "#abs"
syn match  gringoFunction   "#avg"
syn match  gringoFunction   "#mod"
syn match  gringoFunction   "#odd"
syn match  gringoFunction   "#even"
syn match  gringoFunction   "#pow"
syn match  gringoFunction   "#program"

syn region gringoString   start=+"+ skip=+\\"+ end=+"+
syn match  gringoKey      "\<not\>"
syn match  gringoKey      "#false"
syn match  gringoKey      "#true"
syn match  gringoFunction "#compute"
syn match  gringoVar      "\<_*[A-Z]['a-zA-Z0-9_]*\>'*"
syn match  gringoOperator "=\|<\|<=\|>\|>=\|=\|==\|!="
syn match  gringoNumber   "\<[0123456789]*\>"
syn match  gringoRule     ":-"

syn sync maxlines=500

command! -nargs=+ HiLink hi def link <args>

HiLink gringoComment        Comment
HiLink gringoBlockComment   Comment

HiLink gringoKeyword            Type
HiLink gringoFunction           PreProc
HiLink gringoNumber             Number
HiLink gringoString             String
HiLink gringoOperator           Special
HiLink gringoRule               Special
HiLink gringoVar                Identifier
HiLink gringoError              Error
HiLink gringoKey                Keyword

delcommand HiLink

let b:current_syntax = "gringo"


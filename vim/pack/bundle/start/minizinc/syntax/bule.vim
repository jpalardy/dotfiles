if version < 600
   syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match  buleKeyword    "\*%"
syn match  buleComment    +%.*+
syn region buleBlockComment start="%\*" end="\*%"

syn match  buleError          "#.*"

syn match  buleKeyword    "#ishift"
syn match  buleKeyword    "#base"
syn match  buleKeyword    "#domain"
syn match  buleKeyword    "#hide"
syn match  buleKeyword    "#show"
syn match  buleKeyword    "#cumulative"
syn match  buleKeyword    "#volatile"
syn match  buleKeyword    "#const"
syn match  buleKeyword    "#include"
syn match  buleKeyword    "#incremental"
syn match  buleKeyword    "#sup"
syn match  buleKeyword    "#inf"
syn match  buleKeyword    "#supremum"
syn match  buleKeyword    "#infimum"
syn match  buleKeyword    "#undef"
syn match  buleKeyword    "#exists"
syn match  buleKeyword    "#forall"
syn match  buleKeyword    "#ground"

syn match  buleFunction   "#min"
syn match  buleFunction   "#max"
syn match  buleFunction   "#minimise"
syn match  buleFunction   "#maximise"
syn match  buleFunction   "#minimize"
syn match  buleFunction   "#maximize"
syn match  buleFunction   "#external"
syn match  buleFunction   "#count"
syn match  buleFunction   "#sum"
syn match  buleFunction   "#times"
syn match  buleFunction   "#abs"
syn match  buleFunction   "#avg"
syn match  buleFunction   "#mod"
syn match  buleFunction   "#odd"
syn match  buleFunction   "#even"
syn match  buleFunction   "#pow"
syn match  buleFunction   "#program"

syn region buleString   start=+"+ skip=+\\"+ end=+"+
syn match  buleKey      "\<not\>"
syn match  buleKey      "#false"
syn match  buleKey      "#true"
syn match  buleFunction "#compute"
syn match  buleVar      "\<_*[A-Z]['a-zA-Z0-9_]*\>'*"
syn match  buleOperator "=\|<\|<=\|>\|>=\|=\|==\|!="
syn match  buleNumber   "\<[0123456789]*\>"
syn match  buleRule     "->"
syn match  buleRule     "::"

syn sync maxlines=500

command! -nargs=+ HiLink hi def link <args>

HiLink buleComment        Comment
HiLink buleBlockComment   Comment

HiLink buleKeyword            Type
HiLink buleFunction           PreProc
HiLink buleNumber             Number
HiLink buleString             String
HiLink buleOperator           Special
HiLink buleRule               Special
HiLink buleVar                Identifier
HiLink buleError              Error
HiLink buleKey                Keyword

delcommand HiLink

let b:current_syntax = "bule"


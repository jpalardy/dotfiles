if version < 600
   syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match  gcnfKeyword    "\*%"
syn match  gcnfComment    +%.*+
syn region gcnfBlockComment start="%\*" end="\*%"

syn match  gcnfError          "#.*"

syn match  gcnfKeyword    "#ishift"
syn match  gcnfKeyword    "#base"
syn match  gcnfKeyword    "#domain"
syn match  gcnfKeyword    "#hide"
syn match  gcnfKeyword    "#show"
syn match  gcnfKeyword    "#cumulative"
syn match  gcnfKeyword    "#volatile"
syn match  gcnfKeyword    "#const"
syn match  gcnfKeyword    "#include"
syn match  gcnfKeyword    "#incremental"
syn match  gcnfKeyword    "#sup"
syn match  gcnfKeyword    "#inf"
syn match  gcnfKeyword    "#supremum"
syn match  gcnfKeyword    "#infimum"
syn match  gcnfKeyword    "#undef"

syn match  gcnfFunction   "#min"
syn match  gcnfFunction   "#max"
syn match  gcnfFunction   "#minimise"
syn match  gcnfFunction   "#maximise"
syn match  gcnfFunction   "#minimize"
syn match  gcnfFunction   "#maximize"
syn match  gcnfFunction   "#external"
syn match  gcnfFunction   "#count"
syn match  gcnfFunction   "#sum"
syn match  gcnfFunction   "#times"
syn match  gcnfFunction   "#abs"
syn match  gcnfFunction   "#avg"
syn match  gcnfFunction   "#mod"
syn match  gcnfFunction   "#odd"
syn match  gcnfFunction   "#even"
syn match  gcnfFunction   "#pow"
syn match  gcnfFunction   "#program"

syn region gcnfString   start=+"+ skip=+\\"+ end=+"+
syn match  gcnfKey      "\<not\>"
syn match  gcnfKey      "#false"
syn match  gcnfKey      "#true"
syn match  gcnfFunction "#compute"
syn match  gcnfVar      "\<_\|_*[A-Z]['a-zA-Z0-9_]*\>'*"
syn match  gcnfRule     "->"
syn match  gcnfOperator "=\|<\|<=\|>\|>=\|=\|==\|!="
syn match  gcnfNumber   "\<[0123456789]*\>"

syn sync maxlines=500

command! -nargs=+ HiLink hi def link <args>

HiLink gcnfComment        Comment
HiLink gcnfBlockComment   Comment

HiLink gcnfKeyword            Type
HiLink gcnfFunction           PreProc
HiLink gcnfNumber             Number
HiLink gcnfString             String
HiLink gcnfOperator           Special
HiLink gcnfRule               Statement
HiLink gcnfVar                Identifier
HiLink gcnfError              Error
HiLink gcnfKey                Keyword

delcommand HiLink

let b:current_syntax = "gcnf"


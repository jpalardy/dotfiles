" Vim syntax file
" Language:	Pig
" Maintainer:	Sergiy Matusevych <motus2@yahoo.com>

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Pig keywords:

syn keyword pigKeyword load store filter foreach order arrange distinct
syn keyword pigKeyword cogroup join cross union split into if all any as cube rollup
syn keyword pigKeyword by using inner outer parallel group
syn keyword pigKeyword continuously window tuples generate eval
syn keyword pigKeyword input output ship cache stream through
syn keyword pigKeyword seconds minutes hours asc desc null left right full
syn keyword pigKeyword limit mapreduce sample

syn keyword pigType chararray bytearray int long float double tuple bag map boolean

syn keyword pigOperator and or not matches is
"syn keyword pigOperator ? : == != > >= < <= + - % * /

syn match pigFunction "\<[a-zA-Z][a-zA-Z0-9_]*\s*(" contains=pigFunctionName

" Eval functions
syn keyword pigFunctionName avg concat count count_star diff IsEmpty contained
syn keyword pigFunctionName max min size sum tokenize contained
" Load/store functions
syn keyword pigFunctionName BinStorage JsonLoader JsonStorage PigDump contained
syn keyword pigFunctionName PigStorage TextLoader contained
" Math functions
syn keyword pigFunctionName abs acos asin atan cbrt ceil cos cosh exp contained
syn keyword pigFunctionName floor log log10 random round sin sinh contained
syn keyword pigFunctionName sqrt tan tanh contained
" String functions
syn keyword pigFunctionName indexof last_index_of lcfirst lower contained
syn keyword pigFunctionName regex_extract regex_extract_all replace contained
syn keyword pigFunctionName strsplit substring trim ucfirst upper contained
" Other function
syn keyword pigFunctionName totuple tobag tomap top flatten arity returns contained

syn match pigAssignVar "^\s*[a-zA-Z][a-zA-Z0-9_]*\s*=[^=]" contains=pigAssignEq
syn match pigAssignEq  "=" contained

syn match pigSpecial "[#*]"

syn match pigGrunt "^\s*\(cat\|cd\|cp\|copyFromLocal\|copyToLocal\|define\|dump\|illustrate\|describe\|explain\|help\|kill\|ls\|mv\|mkdir\|pwd\|quit\|import\|register\|rm\|rmf\|set\)\>.*$" contains=pigGruntCmd,pigRegisterKeyword,pigString,pigComment
syn match pigGruntCmd "^\s*\(cat\|cd\|cp\|copyFromLocal\|copyToLocal\|define\|dump\|illustrate\|describe\|explain\|help\|kill\|ls\|mv\|mkdir\|pwd\|quit\|rm\|rmf\|set\)\>" contained
syn match pigRegisterKeyword "^\s*\(register\|import\)\>" contained

syn match pigDefineAlias "^\s*define" nextgroup=pigDefinedAlias skipwhite
syn match pigDefinedAlias "[a-zA-Z0-9_]\+" contained skipwhite

" Strings and characters:
syn region pigString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region pigString		start=+'+  skip=+\\\\\|\\'+  end=+'+
syn region pigString		start=+`+  skip=+\\\\\|\\`+  end=+`+

" Dollar variables:
syn match pigDollarVar "$[a-zA-Z0-9_]\+"

" Numbers:
syn match  pigNumber "[-+]\=\(\<\d[[:digit:]_]*L\=\>\|0[xX]\x[[:xdigit:]_]*\>\)"
syn match  pigFloat  "[-+]\=\<\d[[:digit:]_]*[eE][\-+]\=\d\+"
syn match  pigFloat  "[-+]\=\<\d[[:digit:]_]*\.[[:digit:]_]*\([eE][\-+]\=\d\+\)\="
syn match  pigFloat  "[-+]\=\<\.[[:digit:]_]\+\([eE][\-+]\=\d\+\)\="

" Comments:
syn region pigComment start="/\*" end="\*/" contains=pigTodo
syn match pigComment "--.*$" contains=pigTodo
syn match pigComment "^\s*#.*$" contains=pigTodo

syn sync ccomment pigComment

" Todo.
syn keyword pigTodo TODO FIXME XXX DEBUG NOTE contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pigComment   Comment
  HiLink pigOpWord    Label
  HiLink pigOperator  Operator
  HiLink pigType      Type
  HiLink pigSpecial   Special
  HiLink pigKeyword   Statement
  HiLink pigNumber    Number
  HiLink pigFloat     Float
  HiLink pigDollarVar Constant
  HiLink pigAssignVar Identifier
  HiLink pigString    String
  HiLink pigTodo      Todo

  HiLink pigFunctionName Function

  HiLink pigGrunt String
  HiLink pigGruntCmd Statement
  HiLink pigRegisterKeyword Include

  HiLink pigDefinedAlias Identifier
  HiLink pigDefineAlias Define

  delcommand HiLink
endif

let b:current_syntax = "pig"


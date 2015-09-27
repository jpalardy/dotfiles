" Vim syntax file
" Language:     Zinc
" Author:       Nicholas Nethercote <njn@csse.unimelb.edu.au>
" Based on Ralph Becket's mercury.vim.
" vim: ts=2 sw=2 et

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "zinc"

  " Zinc is case sensitive.
  "
syn case match

  " The default highlighting for Zinc comments is to highlight
  " everything including the comment text.  To only highlight the
  " initial `%' and subsequent `line' punctuation characters, put:
  "
  "   let zinc_only_highlight_comment_start = 1
  "
  " somewhere in your `.vimrc' file.
  "
  " By default, parts of lines that extend over 80 characters will be
  " highlighted.  To avoid this behaviour, add
  "
  "   let zinc_no_highlight_overlong = 1
  "
  " somewhere in your `.vimrc' file.
  "
if exists("zinc_only_highlight_comment_start") && zinc_only_highlight_comment_start
  syn region  zincComment      start=+%[-=%*_]*+ end=+.*$+he=s-1                             contains=zincToDo
else
  syn region  zincComment      start=+%+ end=+.*$+                                           contains=zincToDo
endif

syn keyword zincType        ann any array bool enum float int list of record
syn keyword zincType        set string tuple par var

syn keyword zincKeyword     annotation assert case constraint
syn keyword zincKeyword     else elseif endif function if in include let
syn keyword zincKeyword     minimize maximize op output predicate satisfy
syn keyword zincKeyword     solve test then type where

syn match   zincInt   		  "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match   zincFloat		    "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match   zincFloat		    "\<[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

syn keyword zincOp          not xor subset superset
syn keyword zincOp          union diff symdiff intersect div mod
syn match   zincOp          &\.\.\|+\|-\|\*\|\/\|++&
syn match   zincOp          +<->\|<-\|->\|/\\\|\\/+
" Although '=' can be an operator, don't highlight it because it's mostly
" used in definitions.  Likewise, 'in' can be an operator, but we treat it
" as a keyword because it's mostly used in generators.
syn match   zincOp          +==\|!=\|<>\|=<\|<=\|<\|>=\|=>\|>\|>+
syn match   zincOp          +\.\.\.+

syn keyword zincToDo        XXX TODO NOTE         
syn region  zincString       start=+"+ skip=+\\.+ end=+"+                              contains=zincStringFmt
syn match   zincStringFmt    +\\[abfnrtv]\|\\x[0-9a-fA-F]*\\\|%[-+# *.0-9]*[dioxXucsfeEgGp]+                                                                           contained

if !exists("zinc_no_highlight_overlong") || !zinc_no_highlight_overlong
  " The complicated regexp here matches an 80-column string,
  " with proper treatment of tabs (assuming the tab size is 8):
  " each row consists of 10 columns, and each column consists of either 8
  " non-tab characters, or 0-7 non-tab characters followed by a tab.
  syn match   zincFirst80 +^\([^	]\{8}\|[^	]\{0,7}	\)\{10}+                                contains=ALL
  syn match   zincTooLong +^\([^	]\{8}\|[^	]\{0,7}	\)\{10}..*+                             contains=zincFirst80
endif

syn region  cComment   start="/\*" end=".*\*/"                                          contains=zincToDo

syn sync fromstart

hi link zincComment          Comment
hi link cComment             Comment
hi link zincType             Type
hi link zincInt              Number
hi link zincFloat            Number
hi link zincKeyword          Keyword
hi link zincToDo             Todo
hi link zincOp               Special
hi link zincString           String
hi link zincStringFmt        Special
hi link zincAtom             Constant
hi link zincTooLong          ErrorMsg

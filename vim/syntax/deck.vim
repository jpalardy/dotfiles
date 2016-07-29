" Vim syntax file
" Language: Deck file -- PAR format
" Maintainer: Jonathan Palardy
" Latest Revision: March 8, 2012

if exists("b:current_syntax")
  finish
endif

"-------------------------------------------------

syntax match deckDate /\d\d\d\d-\d\d-\d\d/ nextgroup=deckFailGrade,deckPassGrade skipwhite
syntax match deckUnknownDate /????-??-??/  nextgroup=deckFailGrade,deckPassGrade skipwhite

syntax match deckFailGrade /0/ contained
syntax match deckPassGrade /1/ contained

syntax match deckBlank /▒/ 

"-------------------------------------------------

hi def link deckDate        Identifier
hi def link deckUnknownDate Comment
hi def link deckPassGrade   Number
hi def link deckFailGrade   Error

hi def link deckBlank Todo

let b:current_syntax = "deck"


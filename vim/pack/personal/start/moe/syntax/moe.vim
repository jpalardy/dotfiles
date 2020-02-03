" Vim syntax file
" Language: moe file -- like .txt but cuter
" Maintainer: Jonathan Palardy

if exists("b:current_syntax")
  finish
endif

"-------------------------------------------------

" a header is a line that starts with a capital letter and
" doesn't have lowercase letters
syntax match moeHeader /^[A-Z][^a-z]*$/

" @person
syntax match moePerson "\w\@<!@\w\+"

" #hashtag
syntax match moeHashtag "\w\@<!#[-a-zA-Z0-9_]\+"

" emphasis
syntax match moeHighlight     /.* <-$/
syntax match moeImportant     /.* !$/
syntax match moeLessImportant /.* #$/

" [TAGS]
syntax match moeTag     /\[[^]]\+\]/

" `backtick`
syntax match moeBacktick /`[^`]\+`/

syntax match moeDivider /^-\+$/

syntax match moeDate        /\d\d\d\d-\d\d-\d\d/
syntax match moePhoneNumber /\d\d\d.\d\d\d.\d\d\d\d/
syntax match moeURL         /https\?:[^ ]\+/

"-------------------------------------------------

hi def link moeHeader        Keyword
hi def link moePerson        Special
hi def link moeHashtag       Underlined
hi def link moeHighlight     Todo
hi def link moeImportant     Error
hi def link moeLessImportant Comment
hi def link moeTag           Identifier
hi def link moeDivider       Comment
hi def link moeDate          Number
hi def link moePhoneNumber   Number
hi def link moeURL           Comment
hi def link moeBacktick      String

let b:current_syntax = "moe"


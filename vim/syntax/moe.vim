" Vim syntax file
" Language: moe file -- like .txt but cuter
" Maintainer: Jonathan Palardy
" Latest Revision: March 8, 2012

if exists("b:current_syntax")
  finish
endif

"-------------------------------------------------

syntax match moeHeader /^[- A-Z0-9']*$/

" emphasis
syntax match moeHighlight     /.* <-$/
syntax match moeImportant     /.* !$/
syntax match moeLessImportant /.* #$/

" [TAGS]
syntax match moeTag     /\[[^]]\+\]/

syntax match moeDivider /^-*$/

syntax match moeDate        /\d\d\d\d-\d\d-\d\d/
syntax match moePhoneNumber /\d\d\d.\d\d\d.\d\d\d\d/
syntax match moeURL         /https\?:[^ ]*/

"-------------------------------------------------

hi def link moeHeader        Keyword
hi def link moeHighlight     Todo
hi def link moeImportant     Error
hi def link moeLessImportant Comment
hi def link moeTag           Identifier
hi def link moeDivider       Comment
hi def link moeDate          Number
hi def link moePhoneNumber   Number
hi def link moeURL           Comment

let b:current_syntax = "moe"


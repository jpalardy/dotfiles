" Vim syntax file
" Language: moe file -- like .txt but cuter
" Maintainer: Jonathan Palardy

if exists("b:current_syntax")
  finish
endif

"-------------------------------------------------

" a header is a line that starts with a capital letter and doesn't have lowercase letters
syntax match moeHeader /^[A-Z][^a-z]*$/
hi def link moeHeader Keyword

" @person
syntax match moePerson "\w\@<!@\w\+"
hi def link moePerson SpecialChar

" #hashtag
syntax match moeHashtag "\w\@<!#[-a-zA-Z0-9_]\+"
hi def link moeHashtag Underlined

" comment
syntax match moeComment /# .*$/
syntax match moeComment /^#$/
hi def link moeComment Comment

" [TAGS]
syntax match moeTag /\[[^]]\+\]/
hi def link moeTag Identifier

" task done
syntax match moeTaskDone /\[x\] .*/
hi def link moeTaskDone Comment

" `backtick`
syntax match moeBacktick /`[^`]\+`/
hi def link moeBacktick String

syntax match moeDivider /^-\+$/
hi def link moeDivider Comment

" ####-##-##
syntax match moeDate /\d\d\d\d-\d\d-\d\d/
hi def link moeDate Number

" ###.###.####
syntax match moePhoneNumber /\<\(1\.\)\?\d\d\d\.\d\d\d\.\d\d\d\d\>/
hi def link moePhoneNumber Number

" url
syntax match moeURL /https\?:[^ ]\+/
hi def link moeURL Comment

let b:current_syntax = "moe"


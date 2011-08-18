
" line containing only CAPITAL letters and spaces
syntax match moeHeader /^[- A-Z0-9']*$/
highlight link moeHeader Keyword

" line ending with a space and <-
syntax match moeHighlight /.* <-$/
highlight link moeHighlight Todo

" line ending with a space and !
syntax match moeImportant /.* !$/
highlight link moeImportant Error

" line ending with a space and a #
syntax match moeLessImportant /.* #$/
highlight link moeLessImportant Comment

" [TAGS]
syntax match moeTag /\[[^]]\+\]/
highlight link moeTag Identifier

" line containing only '-'
syntax match moeDivider /^-*$/
highlight link moeDivider Comment

" a date
syntax match moeDate /\d\d\d\d-\d\d-\d\d/
highlight link moeDate Number

" a phone number
syntax match moeDate /\d\d\d.\d\d\d.\d\d\d\d/
highlight link moeDate Number

" a URL
syntax match moeURL /https\?:[^ ]*/
highlight link moeURL Comment


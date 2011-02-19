
" line containing only CAPITAL letters and spaces
syntax match moeHeader /^[-_A-Z ]*$/
highlight link moeHeader Keyword

" line ending with a space and a !
syntax match moeImportant /.* !$/
highlight link moeImportant Error

" line ending with a space and a #
syntax match moeLessImportant /.* #$/
highlight link moeLessImportant Comment

" line containing only ----------------------
syntax match moeDivider /^-*$/
highlight link moeDivider Comment

" a date
syntax match moeDate /\d\d\d\d-\d\d-\d\d/
highlight link moeDate Number

" a URL
syntax match moeURL /https\?:[^ ]*/
highlight link moeURL Comment


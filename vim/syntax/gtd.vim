
" line containing only CAPITAL letters and spaces
syntax match gtdHeader /^[-_A-Z ]*$/
highlight link gtdHeader Keyword

" line ending with a space and a !
syntax match gtdImportant /.* !$/
highlight link gtdImportant Error

" line ending with a space and a #
syntax match gtdLessImportant /.* #$/
highlight link gtdLessImportant Comment

" line containing only ----------------------
syntax match gtdDivider /^-*$/
highlight link gtdDivider Comment

" a date
syntax match gtdDate /\d\d\d\d-\d\d-\d\d/
highlight link gtdDate Number

" a URL
syntax match gtdURL /https\?:[^ ]*/
highlight link gtdURL Comment

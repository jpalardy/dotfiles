
syntax match gtdHeader /^[A-Z ]*$/
highlight link gtdHeader Keyword

syntax match gtdImportant /.* !$/
highlight link gtdImportant Error

syntax match gtdDivider /^-*$/
highlight link gtdDivider Comment

syntax match gtdDate /\d\d\d\d-\d\d-\d\d/
highlight link gtdDate Number

syntax match gtdURL /https\?:[^ ]*/
highlight link gtdURL Comment

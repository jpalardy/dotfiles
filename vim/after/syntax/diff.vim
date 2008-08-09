
syntax match diffIndexLines /^Index: .*/
hi diffIndexLines ctermbg=red

syntax match diffIndexSep  /^=*$/
hi diffIndexSep  ctermbg=red

syntax match diffFileMarker /^diff.*/
highlight link diffFileMarker Error


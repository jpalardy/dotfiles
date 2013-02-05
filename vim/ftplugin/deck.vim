
" grab something, replace it with <blank>, paste it on the next line
vnoremap <buffer> ,c "aygvc▒<ESC>o<ESC>"ap
nnoremap <buffer> ,c v"aygvc▒<ESC>o<ESC>"ap

nnoremap <buffer> <CR> mbYpO<esc>`b:execute "normal ,c"<CR>`b3j

" surround with square brackets
vnoremap <buffer> ,[ <ESC>`>a]<ESC>`<i[<ESC>
vnoremap <buffer> ,] <ESC>`>a]<ESC>`<i[<ESC>

nnoremap <buffer> ,g v"ay:SplitScratchy "ack '^<c-r>a ;' <c-r>%"<CR>


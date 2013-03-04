
" grab something, replace it with <blank>, paste it on the next line
vnoremap <buffer> ,c "aygvr▒<ESC>o<ESC>"ap
nmap     <buffer> ,c v,c

vmap <buffer> <CR> "zymbYpO<esc>`bgv,c`b3j
nmap <buffer> <CR> v<CR>

" surround with square brackets
vnoremap <buffer> ,[ <ESC>`>a]<ESC>`<i[<ESC>
vnoremap <buffer> ,] <ESC>`>a]<ESC>`<i[<ESC>

nnoremap <buffer> ,g v"ay:SplitScratchy "ack '^<c-r>a ;' <c-r>%"<CR>


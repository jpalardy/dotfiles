
" grab something, replace it with <blank>, paste it on the next line
vnoremap <buffer> ,c "aygvc▒<ESC>o<ESC>"ap
nnoremap <buffer> ,c v"aygvc▒<ESC>o<ESC>"ap

nnoremap <buffer> <CR> mbYpO<esc>`b:execute "normal ,c"<CR>`b3j


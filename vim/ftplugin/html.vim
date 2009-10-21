source ~/.vim/ftplugin/xml.vim

" nmap <buffer> <F3> :%!tidy -q -asxml -indent --indent-spaces 2 -wrap 0 -clean --tidy-mark no --show-warnings no -utf8<CR>
" nmap <buffer> <F4> :%!xmllint --format --html -<CR>

nmap <buffer> <F3> :ScratchDiff("tidy -q -asxml -indent --indent-spaces 2 -wrap 0 -clean --tidy-mark no --show-warnings no -utf8 " . expand("%"))<CR>:set ft=html<CR>kdd<C-w><C-w>


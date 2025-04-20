
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-KEYS MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F6>   :set spell!<CR>
inoremap <F6>   <C-o>:set spell!<CR>
nnoremap <F7>   :set wrap!<CR>
inoremap <F7>   <C-o>:set wrap!<CR>
set pastetoggle=<F8>

nnoremap <ESC>l :set list!<CR>
nnoremap <ESC>n :set number!<CR>
nnoremap <ESC><SPACE> :nohl<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMA MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:preserve(command)
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  execute a:command
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" STRIP -- EMPTY LINE ENDINGS
nnoremap _$ :call <SID>preserve("%s/\\s\\+$//e")<CR>
vnoremap _$ :call <SID>preserve( "s/\\s\\+$//e")<CR>

" DEDUP ADJACENT EMPTY LINES
nnoremap _B :call <SID>preserve("g/\\_^\\n\\{2,}/d")<CR>

" COMMATIZE
vnoremap ,, :! paste -s -d, -<CR>
" ARRAY-IFY
vnoremap ,[ :! jq -R . \| jq -s . -c<CR>
" QUOTISIZE
vnoremap ,' :! jq -R . \| sed -e "s/\"/'/g"<CR>
vnoremap ," :! jq -R .<CR>
" AWK
vnoremap ,a :! awk -e '{print }'<LEFT><LEFT>

" ONLY KEEP/DROP LINES WHICH CONTAIN SEARCH
nnoremap ,v :v/<C-R>//d<CR>gg
nnoremap ,d :g/<C-R>//d<CR>gg
vnoremap ,v :v/<C-R>//d<CR>gg
vnoremap ,d :g/<C-R>//d<CR>gg

nnoremap ,l :!clear; cloc --quiet --by-file %<CR>
nnoremap ,a :exe "!clear; CURRENT_LINE=" . line(".") . " summary-" . &ft . " " . expand("%")<CR>

nnoremap ,wd :windo normal

function! s:widthWithGutter(lines)
  let max_width = max(map(a:lines,'len(v:val)'))
  let gutter = (&number ? &numberwidth : 0)
  let padding = 2
  return max_width + gutter + padding
endfunction

" FIT WIDTH TO LONGEST LINE
nnoremap ,- :execute "vertical resize" . <SID>widthWithGutter(getline(1,'$'))<CR>
vnoremap ,- <ESC>:execute "vertical resize" . <SID>widthWithGutter(getline("'<","'>"))<CR>

" OPEN xxd OF CURRENT BUFFER
nnoremap ,x :execute ":vnew \| :Scratchy \"xxd " . expand("%") . "\""<CR>:set ft=xxd<CR>

" RELOAD TO RELATIVE PATH
nnoremap ,r :execute ":bwipeout \| vsp +" . line('.') fnamemodify(@%, ":~:.")<CR>zz

" SPLIT-SEARCH
nnoremap ,sa :sp<CR><c-w>k?

" SUMMARY OF SEARCH IN CURRENT FILE
nnoremap ,g :!clear; rg -i <c-r>/ %<CR>

function! s:currentLineInGrepFormat()
  let result = printf("%s:%d:%d:%s", expand("%"), line("."), col("."), getline("."))
  echom result
  return result
endfunction

" APPEND quickfix format info TO .ws FILE
nnoremap ,, :call writefile([<SID>currentLineInGrepFormat()], ".ws", "a")<CR>
nnoremap ,< :cfile .ws<CR>

" EASIER SYSTEM CLIPBOARD
vnoremap ,b "*y
nnoremap ,b "*p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BACKSLASH MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" buffer
nnoremap \<left>  :leftabove  vnew<CR>
nnoremap \<right> :rightbelow vnew<CR>
nnoremap \<up>    :leftabove  new<CR>
nnoremap \<down>  :rightbelow new<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" noop
nnoremap <silent> Q :<CR>

" display line up/down (not actual)
noremap <up> gk
noremap <down> gj

" search next/previous -- center in page
nnoremap * *N
nnoremap g* g*N

" search selected text
vnoremap // y/<C-R>"<CR>

" one-key indentation
nnoremap > >>
nnoremap < <<

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEW TAB
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" new tab
nnoremap tt :tabedit<CR>

" open current-file in a tab
nnoremap tf :tabedit <cfile><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" like vim-unimpaired, but without all that other code
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>


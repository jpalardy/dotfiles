
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-KEYS MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F2>   :ALENextWrap<CR>
inoremap <F2>   <C-o>:ALENextWrap<CR>
nnoremap <F3>   :ALEToggle<CR>
inoremap <F3>   <C-o>:ALEToggle<CR>
nnoremap <F4>   :call ToggleQuickfix()<CR>

function! ToggleQuickfix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction

nnoremap <F5>   :ToggleSpaceHi<CR>
inoremap <F5>   <C-o>:ToggleSpaceHi<CR>
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

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" STRIP -- EMPTY LINE ENDINGS
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
vnoremap _$ :call Preserve( "s/\\s\\+$//e")<CR>

" DEDUP ADJACENT EMPTY LINES
nnoremap _B :call Preserve("g/\\_^\\n\\{2,}/d")<CR>

" COMMATIZE
vnoremap ,, :! paste -s -d, -<CR>
" ARRAY-IFY
vnoremap ,[ :! jq -R . \| jq -s . -c<CR>
" QUOTISIZE
vnoremap ,' :! jq -R . \| sed -e "s/\"/'/g"<CR>
vnoremap ," :! jq -R .<CR>
" AWK
vnoremap ,a :! awk '{print }'<LEFT><LEFT>

" ONLY KEEP LINES WHICH CONTAIN SEARCH
nnoremap ,v :v/<C-R>//d<CR>gg
nnoremap ,d :g/<C-R>//d<CR>gg

nnoremap ,l :! cloc --quiet --by-file %<CR>
nnoremap ,a :exe "! CURRENT_LINE=" . line(".") . " summary-" . &ft . " " . expand("%")<CR>

nnoremap ,wd :windo normal 

" FIT WIDTH TO LONGEST LINE
nnoremap ,- :execute "vertical resize" . max(map(getline(1,'$'),'len(v:val)'))<CR>
vnoremap ,- <ESC>:execute "vertical resize" . max(map(getline("'<","'>"),'len(v:val)'))<CR>

" OPEN xxd OF CURRENT BUFFER
nnoremap ,x :execute ":vnew \| :Scratchy \"xxd " . expand("%") . "\""<CR>:set ft=xxd<CR>

" RELOAD TO RELATIVE PATH
nnoremap ,r :execute ":bwipeout \| vsp +" . line('.') fnamemodify(@%, ":~:.")<CR>zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> Q :qa<CR>

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

" open non-existing file; inspired by gf
nnoremap gF :e <cfile><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEW TAB
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap tt :tabedit<CR>

function! GrepForCurrentSearch()
  let _s=@/
  let _s=substitute(_s, '^[\\]<', '\\b', '')
  let _s=substitute(_s, '[\\]>', '\\b', '')
  tabedit
  silent! execute "grep -i " . shellescape(_s)
  redraw!
endfunction

nnoremap tg :call GrepForCurrentSearch()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" buffer
nnoremap \<left>  :leftabove  vnew<CR>
nnoremap \<right> :rightbelow vnew<CR>
nnoremap \<up>    :leftabove  new<CR>
nnoremap \<down>  :rightbelow new<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" like vim-unimpaired, but without all that other code
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap ,s :vert Git<cr>


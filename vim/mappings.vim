
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-KEYS MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F5>   :ToggleSpaceHi<CR>
inoremap <F5>   <C-o>:ToggleSpaceHi<CR>
nnoremap <F6>   :set spell!<CR>
inoremap <F6>   <C-o>:set spell!<CR>
nnoremap <F7>   :set wrap!<CR>
inoremap <F7>   <C-o>:set wrap!<CR>
set pastetoggle=<F8>

nnoremap <ESC>l :set list!<CR>
nnoremap <ESC>n :set number!<CR>
nnoremap <ESC>N :set relativenumber!<CR>
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
" STRIP -- EMPTY LINE BEGINNINGS
nnoremap _^ :call Preserve("%s/^\\s\\+//e")<CR>
vnoremap _^ :call Preserve( "s/^\\s\\+//e")<CR>

" COMMATIZE
vnoremap ,, :! paste -s -d, -<CR>
" QUOTISIZE
vnoremap ,' :! awk '{print "'\''"$0"'\''"}'<CR>
vnoremap ," :! awk '{print "\""$0"\""}'<CR>
" AWK
vnoremap ,a :! awk '{print }'<LEFT><LEFT>

" ONLY KEEP LINES WHICH CONTAIN SEARCH
nnoremap ,v :v/<C-R>//d<CR>gg
nnoremap ,d :g/<C-R>//d<CR>gg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> Q :qa<CR>

" buffer list on tab
nnoremap <tab> :buffers<CR>:buffer<Space>

" easier to reach, overrides TOP and BOTTOM of screen
nnoremap H ^
nnoremap L $

" display line up/down (not actual)
noremap <up> gk
noremap <down> gj

" search next/previous -- center in page
nnoremap n nzz
nnoremap N Nzz
nnoremap * *Nzz

" one-key indentation
nnoremap > >>
nnoremap < <<

" nerd commenter
vnoremap # :call NERDComment(1, "toggle")<CR>
nnoremap # V:call NERDComment(1, "toggle")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" window
nnoremap \|<left>  :topleft  vnew<CR>
nnoremap \|<right> :botright vnew<CR>
nnoremap \|<up>    :topleft  new<CR>
nnoremap \|<down>  :botright new<CR>

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
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabularize on pipe (<BAR>)
vnoremap <BAR><BAR> :Tab /
vnoremap <BAR>:     :Tab /:\zs/l0l1<CR>
vnoremap <BAR>=     :Tab /=<CR>


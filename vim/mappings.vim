
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-KEYS MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F4> :w<CR>:make<CR>:cw<CR>
imap <F4> <ESC><F4>

nmap <F5>   :ToggleSpaceHi<CR>
imap <F5>   <C-o><F5>
nmap <F6>   :set spell!<CR>
imap <F6>   <C-o><F6>
nmap <F7>   :set wrap!<CR>
imap <F7>   <C-o><F7>
set pastetoggle=<F8>

nmap <ESC>l :set list!<CR>
nmap <ESC>n :set number!<CR>
nmap <ESC><SPACE> :nohl<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMA MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" STRIP -- EMPTY LINE ENDINGS
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
vmap _$ :call Preserve( "s/\\s\\+$//e")<CR>
" STRIP -- EMPTY LINE BEGINNINGS
nmap _^ :call Preserve("%s/^\\s\\+//e")<CR>
vmap _^ :call Preserve( "s/^\\s\\+//e")<CR>

" COMMATIZE
vmap ,, :! paste -s -d, -<CR>
" QUOTISIZE
vmap ,' :! awk '{print "'\''"$0"'\''"}'<CR>
vmap ," :! awk '{print "\""$0"\""}'<CR>
" AWK
vmap ,a :! awk '{print }'<LEFT><LEFT>

" ONLY KEEP LINES WHICH CONTAIN SEARCH
nmap ,v :v/<C-R>//d<CR>gg
nmap ,d :g/<C-R>//d<CR>gg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> Q :qa<CR>

" buffer list on tab
nmap <tab> :buffers<CR>:buffer<Space>

" easier to reach, overrides TOP and BOTTOM of screen
map H ^
map L $

" display line up/down (not actual)
map <up> gk
map <down> gj

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz

" one-key indentation
nmap > >>
nmap < <<

" nerd commenter
vmap # :call NERDComment(1, "toggle")<CR>
nmap # V#

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" window
nmap \|<left>  :topleft  vnew<CR>
nmap \|<right> :botright vnew<CR>
nmap \|<up>    :topleft  new<CR>
nmap \|<down>  :botright new<CR>

" buffer
nmap \<left>  :leftabove  vnew<CR>
nmap \<right> :rightbelow vnew<CR>
nmap \<up>    :leftabove  new<CR>
nmap \<down>  :rightbelow new<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QUICKFIX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" like vim-unimpaired, but without all that other code
nmap <silent> [q :cprevious<CR>
nmap <silent> ]q :cnext<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabularize on pipe (<BAR>)
vmap <BAR> :Tab /


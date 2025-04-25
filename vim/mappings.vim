
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


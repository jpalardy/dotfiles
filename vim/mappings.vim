
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-KEYS MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F2>   :Errors<CR>:lnext<CR>

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

" search selected text
vnoremap // y/<C-R>"<CR>

" one-key indentation
nnoremap > >>
nnoremap < <<

" nerd commenter
vnoremap # :call NERDComment(1, "toggle")<CR>
nnoremap # V:call NERDComment(1, "toggle")<CR>

nnoremap ,wd :windo normal 

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
" COLORSCHEME ROTATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RotateColorscheme()
  let l:schemes = ["256_xoria", "256_railscasts", "256_jellybeans", "256_wombat"]
  let l:i = (index(l:schemes, g:colors_name) + 1) % len(l:schemes)
  execute "colorscheme " . l:schemes[l:i]
  redraw | echo l:schemes[l:i]
endfunction

nnoremap ,c :call RotateColorscheme()<cr>


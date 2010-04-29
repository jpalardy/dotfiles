""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VIM, not VI
set nocompatible

" General appearance and behaviour
filetype plugin indent on
syntax on
set visualbell t_vb=
set noerrorbells
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start
set nowrap
set linebreak
set lazyredraw

set nomodeline

" MOUSE with VIM ! (YES)
" set mouse=a
" set ttymouse=xterm2
set scrolloff=1

" Indentation options
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set virtualedit=block
set equalprg=

" Search options
set incsearch
set hlsearch
set ignorecase

" Print options ...
set printoptions=header:0

" This is useful for debugging
" set verbose=9

if v:version >= 700
  set spellcapcheck=
endif

if has('gui_running')
  " nothing please
  set guioptions=
  set guifont=Inconsolata\ 16
endif

if $TERM == "xterm-256color"
  colorscheme 256_xoria
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-KEYS MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F2> :set spell!<CR>

"nmap <F5>   -- mapped for SpaceHi
nmap <F6>   :call Toggle_syntax()<CR>
nmap <F7>   :set wrap!<CR>
nmap <F8>   :set paste!<CR>

nmap <ESC>l :set list!<CR>
nmap <ESC>n :set number!<CR>
nmap <ESC><SPACE> :nohl<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TOGGLERS -- for F-keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Toggle_syntax()
  if has("syntax_items")
    syntax off
    echo "syntax off"
  else
    syntax enable
    echo "syntax on"
  endif
endfunction

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
" SURROUND
vmap S :! awk '{print ""$0""}'<LEFT><LEFT><LEFT>
" AWK
vmap ,<TAB>a :!awk -F'	' '{print }'<LEFT><LEFT>
vmap ,a      :!awk '{print }'<LEFT><LEFT>

" ONLY KEEP LINES WHICH CONTAIN SEARCH
nmap ,v :v/<C-R>//d<CR>gg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" switch to other window, make it maximum height
nmap <ESC>w <C-w>w<C-w>_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMDIFF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <ESC>du :diffupdate<CR>
nmap <ESC>do :%diffget<CR>

set diffopt=filler,iwhite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACEHI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
au FileType help NoSpaceHi
au FileType diff NoSpaceHi
au FileType scratchy NoSpaceHi

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set in variables.sh
let g:sql_type_default=$DB_ADAPTER

vmap # :call NERDComment(1, "toggle")<CR>
nmap # V#

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCRATCHY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <ESC>s :Scratchy ""<LEFT>

" ack
nnoremap <ESC>a :SplitScratchy "ack --group "<LEFT>

" filtering
nnoremap <ESC>f :SplitScratchy b:fileFilterCmd . " " . expand("%")<CR>

function! FilePicker()
  nmap <buffer> <CR> gf
  nmap <buffer> <ESC><CR> <c-w>f<c-w>w
  echo
endfunction

" flush ack_find's cache
nnoremap <leader>aff :call system("ack_find -f")<CR>

" textmate-like command-t
nnoremap <ESC>t :botright  new<CR>:Scratchy "ack_find"<CR>:call FilePicker()<CR>
nnoremap <ESC>T :botright vnew<CR>:Scratchy "ack_find"<CR>:call FilePicker()<CR>

" replace current buffer
nnoremap <ESC>h                   :Scratchy "ack_find"<CR>:call FilePicker()<CR>


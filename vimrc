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
set mouse=a
set ttymouse=xterm2
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
nmap _$ :% s_\s\+$__g <CR>
vmap _$ :  s_\s\+$__g <CR>
" STRIP -- EMPTY LINE BEGINNINGS
nmap _^ :% s_^\s\+__g <CR>
vmap _^ :  s_^\s\+__g <CR>
" STRIP -- EMPTY LINES
nmap _- :% g/^\s*$/d<CR>
vmap _- :  g/^\s*$/d<CR>
" STRIP UNTIL NON-SPACE RIGHT/LEFT
nmap d<RIGHT> d/\S<CR>:nohl<CR>
nmap d<LEFT>  d?\S?e+1<CR>:nohl<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" display line up/down (not actual)
map <up> gk
map <down> gj

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:sql_type_default='sqlite'


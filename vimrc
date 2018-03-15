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
set showmatch
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start
set nowrap
set linebreak
set listchars=eol:$,nbsp:%

" don't load modelines...
set nomodeline

" with git, ever needed?
set noswapfile
set nowritebackup
set nobackup

" Search options
set incsearch
set hlsearch
set ignorecase

" Indentation options
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set virtualedit=block
set scrolloff=1

set equalprg=

" don't insert 2 spaces after punctuation
set nojoinspaces

" vimdiff
set diffopt=filler,iwhite

set spellcapcheck=

set updatetime=250

" statusline -related items
set noruler
set noshowmode
set showcmd
set laststatus=2

if match($TERM, '256color$') != -1
  colorscheme 256_xoria
endif

" This is useful for debugging
" set verbose=9

source $HOME/.vim/mappings.vim
source $HOME/.vim/plugins.vim


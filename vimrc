""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" VIM, not VI
set nocompatible

" pathogen bundles
filetype off
call pathogen#runtime_append_all_bundles()

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
set listchars=eol:$,nbsp:%

" don't load modelines...
set nomodeline

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
set grepprg=ack\ -ai

" don't insert 2 spaces after punctuation
set nojoinspaces

" vimdiff
set diffopt=filler,iwhite

set spellcapcheck=

if match($TERM, '256color$') != -1
  colorscheme 256_xoria
endif

" This is useful for debugging
" set verbose=9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPACEHI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
autocmd FileType help     NoSpaceHi
autocmd FileType diff     NoSpaceHi
autocmd FileType man      NoSpaceHi
autocmd FileType scratchy NoSpaceHi

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax *.go NoSpaceHi

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" used by :TOhtml
let g:html_use_css=0

" use tmux for slime
let g:slime_target = "tmux"
"let g:slime_default_config = {"socket_name": "default", "target_pane": "3"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/mappings.vim


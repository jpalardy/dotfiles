
setlocal makeprg=ruby\ -c\ %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets['#!'] = '#!/usr/bin/env ruby'

let b:snippets['attr_$']        = 'attr_accessor'
let b:snippets['attr_accessor'] = 'attr_reader'
let b:snippets['attr_reader']   = 'attr_writer'
let b:snippets['attr_writer']   = 'attr_accessor'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <buffer> <ESC>r      :SplitScratchy 'spec ' . expand("%")<CR>
vmap <buffer> <ESC>r <ESC>:SplitScratchy 'spec ' . expand("%") . " -l " . line(".")<CR>


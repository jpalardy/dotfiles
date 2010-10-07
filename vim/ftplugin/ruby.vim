
let b:fileFilterCmd = "ruby"

let ruby_space_errors = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("b:snippets")
  let b:snippets = {}
endif

let b:snippets['#!'] = '#!/usr/bin/env ruby'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <buffer> <ESC>r      :SplitScratchy 'spec ' . expand("%")<CR>
vmap <buffer> <ESC>r <ESC>:SplitScratchy 'spec ' . expand("%") . " -l " . line(".")<CR>

ab attr_a attr_accessor
ab attr_r attr_reader
ab attr_w attr_writer


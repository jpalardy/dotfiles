
setlocal equalprg=eq-elixir

let b:ale_fix_on_save = 1
let b:ale_linters = ['elixir-ls']
let b:ale_fixers = ['mix_format']

" -------------------------------------------------

nnoremap <buffer> <c-c><c-l> :SlimeSend1 clear()<CR>

" hotkeys
nnoremap <buffer> <c-c>1 :SlimeSend1 recompile<CR>
nnoremap <buffer> <c-c>2 :SlimeSend1 #iex:break<CR>

nnoremap <buffer> <c-c>9 :SlimeSend1 :observer.start<CR>

" -------------------------------------------------

function! Fold_ex()
  setlocal foldmethod=syntax
  setlocal foldlevel=1
  setlocal foldmethod=manual
endfunction

nnoremap <buffer> ,F :call Fold_ex()<CR>

" format selection
vnoremap <buffer> ,f :!mix format -<CR>

" -------------------------------------------------

" wrap pipes in ( ... ); for vim-slime
function! _EscapeText_elixir(text)
  if len(split(a:text, "\n")) > 1
    return ["(\n", a:text, ")\n"]
  endif
  return a:text
endfunction

" -------------------------------------------------

if !exists('*ToggleCodeTest')
  function! ToggleCodeTest()
    let cur_pos = getpos('.')
    silent! 1
    let found_line = search('^defmodule')
    call setpos('.', cur_pos)

    if found_line == 0
      return
    endif

    let module_name = split(getline(found_line))[1]
    let other_module_name = module_name . "Test"
    if match(module_name, "Test$") > 0
      let other_module_name = substitute(module_name, "Test$", "", "")
    endif

    let other_file = system(printf("rg 'defmodule %s\\b' -l", other_module_name))
    let other_file = substitute(other_file, "\n", "", "")
    if other_file != ""
      execute "vsplit " other_file
    endif
  endfunction
endif

nnoremap <buffer> ,t :call ToggleCodeTest()<CR>


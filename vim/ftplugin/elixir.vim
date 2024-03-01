
setlocal equalprg=eq-elixir

if expand('%') != "_vimrepl.exs"
  let b:ale_fix_on_save = 1
endif

let b:ale_linters = ['elixir-ls']
let b:ale_fixers = ['mix_format']
let b:ale_elixir_elixir_ls_release=expand("~/local/bin")

" -------------------------------------------------

nnoremap <buffer> <c-c><c-l> :SlimeSend1 clear()<CR>
nnoremap <buffer> <c-c>, :call SlimeHotKey(['recompile', '#iex:break', ':observer.start'])<CR>

" -------------------------------------------------

function! s:searchLocal()
  silent! grep -i '^ *(def\|describe\|setup\|test)' %
  redraw!
  copen
endfunction

nnoremap <buffer> ,. :call <SID>searchLocal()<CR>

" -------------------------------------------------

function! s:foldSyntax()
  setlocal foldmethod=syntax
  setlocal foldlevel=1
  setlocal foldmethod=manual
endfunction

nnoremap <buffer> ,F :call <SID>foldSyntax()<CR>

" format selection
vnoremap <buffer> ,f :!mix format -<CR>

" -------------------------------------------------

" wrap pipes in ( ... ); for vim-slime
function! _EscapeText_elixir(text)
  if match(a:text, "\n") > -1
    return "(\n" . a:text . ")\n"
  endif
  return a:text
endfunction

" -------------------------------------------------

" this is needed for reload on opening test file
if !exists('*ToggleCodeTest')
  function! ToggleCodeTest()
    let cur_pos = getpos('.')
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
    let other_file = trim(other_file)
    if other_file == ""
      return
    endif

    execute "vsplit " other_file
  endfunction
endif

nnoremap <buffer> ,t :call ToggleCodeTest()<CR>


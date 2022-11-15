
setlocal equalprg=eq-elixir

let b:ale_fix_on_save = 1
let b:ale_linters = ['elixir-ls']
let b:ale_fixers = ['mix_format']

" mix formatter default: https://hexdocs.pm/elixir/main/Code.html#format_string!/2-options
setlocal colorcolumn=98

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

" -------------------------------------------------

" wrap pipes in ( ... ); for vim-slime
function! _EscapeText_elixir(text)
  if len(split(a:text, "\n")) > 1
    return ["(\n", a:text, ")\n"]
  endif
  return a:text
endfunction


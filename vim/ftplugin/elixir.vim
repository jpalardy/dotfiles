
setlocal equalprg=eq-elixir

let b:ale_fix_on_save = 1
let b:ale_linters = ['elixir-ls']
let b:ale_fixers = ['mix_format']

" -------------------------------------------------

nnoremap <buffer> ,n :!tg %<CR>
nnoremap <buffer> <c-c><c-l> :SlimeSend1 clear()<CR>

" hotkeys
nnoremap <buffer> <c-c>1 :SlimeSend1 recompile<CR>
nnoremap <buffer> <c-c>2 :SlimeSend1 #iex:break<CR>

nnoremap <buffer> <c-c>9 :SlimeSend1 :observer.start<CR>

" -------------------------------------------------

function! Fold_ex_doc()
  let start_pos = getpos(".")
  call cursor(1 ,1)
  while search('^ *@\(moduledoc\|doc\|typedoc\) .*"""$', "cWe") > 0
    let line_fold_start = line(".")
    let line_fold_end  = search('"""', "W")
    execute ":" . line_fold_start . "," . line_fold_end . "fold"
  endwhile
  call setpos(".", start_pos)
endfunction

nnoremap <buffer> ,F :call Fold_ex_doc()<CR>


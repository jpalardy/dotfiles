
setlocal equalprg=pp-elixir

let b:ale_fix_on_save = 1

nnoremap <buffer> ,n :!tg %<CR>
nnoremap <buffer> <c-c><c-l> :SlimeSend1 clear()<CR>

" hotkeys
nnoremap <buffer> <c-c>1 :SlimeSend1 recompile<CR>
nnoremap <buffer> <c-c>2 :SlimeSend1 #iex:break<CR>


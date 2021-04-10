
setlocal equalprg=pp-elixir

let b:ale_fix_on_save = 1

nnoremap <buffer> ,n :!tg %<CR>
nmap <buffer> <c-c><c-l> :SlimeSend1 clear()<CR>


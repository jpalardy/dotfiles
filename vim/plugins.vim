
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slime

" use tmux for slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
" let g:slime_bracketed_paste = 1

nmap <c-c><c-l> :SlimeSend0 "\x0c"<CR>
nmap <c-c><c-u> :SlimeSend0 "\x15"<CR>
nmap <c-c>q     :SlimeSend0 "q"<CR>
nmap <c-c>j     <c-c><c-c>}j

nmap <c-c>d <Plug>SlimeSendCell


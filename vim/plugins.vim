
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spacehi

augroup mostly_spacehi
  autocmd!
  autocmd Syntax * SpaceHi
  autocmd FileType help     NoSpaceHi
  autocmd FileType diff     NoSpaceHi
  autocmd FileType man      NoSpaceHi
  autocmd FileType scratchy NoSpaceHi
  autocmd FileType go       NoSpaceHi
  autocmd FileType make     NoSpaceHi
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slime

" use tmux for slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_bracketed_paste = 1

nmap <c-c><c-l> :SlimeSend0 ""<CR>
nmap <c-c><c-u> :SlimeSend0 "\x15"<CR>
nmap <c-c>q     :SlimeSend0 "q"<CR>
nmap <c-c><cr>  <c-c><c-c>}j

nmap <c-c>d <Plug>SlimeSendCell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE

let g:ale_elixir_elixir_ls_release=expand("~/local/bin")
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_floating_preview = 1
let g:ale_cursor_detail = 1
let g:ale_floating_window_border = []
let g:ale_lsp_suggestions = 1
let g:ale_default_navigation = "split"

" show me anything from the language server...
let g:ale_lsp_show_message_severity = "log"

nnoremap K :ALEHover<CR>
nnoremap ,f :ALEFix<CR>

" vscode-like...
nnoremap <F12>  :ALEGoToDefinition<CR>
nnoremap ,<F12> :ALEFindReferences<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline

let g:lightline = {
  \  'inactive': {
  \    'left': [['filename', 'modified']]
  \  }
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd commenter

vnoremap # :call nerdcommenter#Comment('x', 'toggle')<CR>
nnoremap # :call nerdcommenter#Comment('n', 'toggle')<CR>

let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters = {}
let g:NERDCustomDelimiters['rmd'] = {'left': '#'}
let g:NERDCustomDelimiters['zinc'] = {'left': '%'}
let g:NERDCustomDelimiters['moe'] = {'left': '#', 'right': '#'}
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bag

nmap <silent> ,b :r ~/.bag<CR>
vmap <silent> ,b :w! ~/.bag<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabularize

function! BarTab() range
  let line = getline((a:firstline + a:lastline)/2)
  if match(line, ':') != -1
    let @y = "gv:Tabularize /:\\zs/l0l1"
    return
  endif
  if match(line, '=') != -1
    let @y = "gv:Tabularize /="
    return
  endif
  let @y = "gv:Tabularize /"
endfunction

vnoremap <BAR> :call BarTab()<CR>@y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" elm-vim

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet

let g:user_emmet_leader_key = '<C-e>'


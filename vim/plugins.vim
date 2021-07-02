
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

nmap <c-c><c-l> :SlimeSend0 ""<CR>
nmap <c-c><c-u> :SlimeSend0 "\x15"<CR>
nmap <c-c>q     :SlimeSend0 "q"<CR>
nmap <c-c><cr>  <c-c><c-c>}j

nmap <c-c>d <Plug>SlimeSendCell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prettier

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['css']        = ['prettier']
let g:ale_fixers['less']       = ['prettier']
let g:ale_fixers['json']       = ['fixjson', 'jq']
let g:ale_fixers['elixir']     = ['mix_format']
let g:ale_fixers['rust']       = ['rustfmt']
let g:ale_fixers['go']         = ['gofmt', 'goimports']
let g:ale_fixers['elm']        = ['elm-format']
let g:ale_fixers['html']       = ['prettier']
let g:ale_fixers['python']     = ['yapf']

let g:ale_linters = {}
let g:ale_linters['typescript'] = ['tslint', 'tsserver']
let g:ale_linters['go']         = ['gofmt', 'govet']
let g:ale_linters['python']     = ['flake8', 'pylint']
let g:ale_linters['elixir']     = ['exlint', 'elixir-ls']
"let g:ale_linters['rust'] = ['rustc', 'rustfmt']

let g:ale_elixir_elixir_ls_release=expand("~/local/bin")
let g:ale_completion_enabled = 1

nnoremap ,f :ALEFix<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline

let g:lightline = {
  \  'inactive': {
  \    'left': [['filename', 'modified']]
  \  }
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd commenter

vnoremap #  :call NERDComment(1, "toggle")<CR>
nnoremap # V:call NERDComment(1, "toggle")<CR>

let g:NERDCustomDelimiters = {}
let g:NERDCustomDelimiters['rmd'] = {'left': '#'}
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard

nmap ,b "+p
vmap ,b "+y

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


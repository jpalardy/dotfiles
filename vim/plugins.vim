
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

let g:slime_cell_delimiter = "#--"
nmap <c-c>d <Plug>SlimeSendCell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prettier

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['css']        = ['prettier']
let g:ale_fixers['less']       = ['prettier']
let g:ale_fixers['json']       = ['fixjson']
let g:ale_fixers['elixir']     = ['mix_format']
let g:ale_fixers['rust']       = ['rustfmt']
let g:ale_fixers['go']         = ['gofmt', 'goimports']
let g:ale_fixers['elm']        = ['elm-format']

let g:ale_linters = {}
let g:ale_linters['typescript'] = ['tslint', 'tsserver']
let g:ale_linters['go']         = ['gofmt', 'govet', 'golangci-lint']
"let g:ale_linters['rust'] = ['rustc', 'rustfmt']

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bag

nmap ,b :r !bag<CR>
vmap ,b :w !bag<CR>

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



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
" let g:slime_bracketed_paste = 1

nmap <c-c><c-l> :SlimeSend0 "\x0c"<CR>
nmap <c-c><c-u> :SlimeSend0 "\x15"<CR>
nmap <c-c>q     :SlimeSend0 "q"<CR>
nmap <c-c>j     <c-c><c-c>}j

nmap <c-c>d <Plug>SlimeSendCell

function! SlimeHotKey(choices)
  let items = ['send:']
  call extend(items, map(copy(a:choices), 'printf("%d. %s", v:key+1, v:val)'))
  let i = inputlist(items)
  if i == 0 || i > len(a:choices)
    return
  endif
  execute('SlimeSend1 ' . a:choices[i - 1])
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE

let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 0
let g:ale_floating_preview = 1
let g:ale_cursor_detail = 1
let g:ale_floating_window_border = []
let g:ale_lsp_suggestions = 1
let g:ale_default_navigation = "split"
let g:ale_virtualtext_cursor = "disabled"

" show me anything from the language server...
let g:ale_lsp_show_message_severity = "log"

nnoremap K :ALEHover<CR>
nnoremap ,f :ALEFix<CR>

" vscode-like...
nnoremap <F12>  :ALEGoToDefinition -vsplit<CR>
nnoremap ,<F12> :ALEFindReferences<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline

" default inactive is 'filename' only
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
" elm-vim

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vindent

let g:vindent_motion_OO_prev   = '[='
let g:vindent_motion_OO_next   = ']='
let g:vindent_motion_more_prev = '[+'
let g:vindent_motion_more_next = ']+'
let g:vindent_motion_less_prev = '[-'
let g:vindent_motion_less_next = ']-'
let g:vindent_motion_diff_prev = '[;'
let g:vindent_motion_diff_next = '];'


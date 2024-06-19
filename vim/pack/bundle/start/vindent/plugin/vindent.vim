" plugin/vindent.vim

if exists("g:loaded_vindent") | finish | endif | let s:save_cpo=&cpo | set cpo&vim

" Setting: Default vindent count to start from 1.
if !exists("g:vindent_count") | let g:vindent_count = 1 | endif

" Command: Toggle whether vindent tries to infer indentation on empty lines.
if !exists("g:vindent_infer") | let g:vindent_infer = 0 | endif
command -nargs=0 -bang VindentInfer :call <SID>VindentInfer(<bang>1)
function! <SID>VindentInfer(change)
	if a:change | let g:vindent_infer = !g:vindent_infer | endif
	echom " Vindent now " .. ( g:vindent_infer ? "DOES" : "DOES NOT" ) .. " try to infer indentation of empty lines."
endfunction

" Command: Toggle vindent motion move to beginning of line behaviour
if !exists("g:vindent_begin") | let g:vindent_begin = 1 | endif
command -nargs=0 -bang VindentBegin :call <SID>VindentBegin(<bang>1)
function! <SID>VindentBegin(change)
	if a:change | let g:vindent_begin = !g:vindent_begin | endif
	echom " Vindent motions now " .. ( g:vindent_begin ? "DOES" : "DOES NOT" ) .. " move to the beginning of the line."
endfunction

" Command: Toggle vindent jumps behaviour.
if !exists("g:vindent_jumps") | let g:vindent_jumps = 0 | endif
command -nargs=0 -bang VindentJumps :call <SID>VindentJumps(<bang>1)
function! <SID>VindentJumps(change)
	if a:change | let g:vindent_jumps = !g:vindent_jumps | endif
	echom " Vindent motions now " .. ( g:vindent_jumps ? "ON" : "OFF" ) .. " jumplist."
endfunction

" Command: Toggle vindent motion error behaviour.
if !exists("g:vindent_noisy") | let g:vindent_noisy = 0 | endif
command -nargs=0 -bang VindentNoisy :call <SID>VindentNoisy(<bang>1)
function! <SID>VindentNoisy(change)
	if a:change | let g:vindent_noisy = !g:vindent_noisy | endif
	echom " Vindent is now " .. ( g:vindent_noisy ? "NOISY" : "SILENT" ) .. "."
endfunction

" Command: Highlight the indentation level.
if !exists("g:vindent_color") | let g:vindent_color = 'ctermfg=red' | endif
command -nargs=0 -bang VindentHighlight :call <SID>VindentHighlight(<bang>0)
function! <SID>VindentHighlight(clear=0) abort
	if a:clear
		if !exists("b:vindent_list_save") | return | endif
		match
		execu 'set ' .. ( b:vindent_list_save ? '' : 'no' ) .. 'list'
		unlet b:vindent_list_save
	else
		if !exists("b:vindent_list_save") | let b:vindent_list_save = &list | endif
		set list
		let l:number  = indent(line('.')) / &tabstop
		let l:pattern = '/^\('.repeat(' ',&tabstop) .. '\|\t\)\{' .. l:number .. '}\zs\s\ze/'
		exe 'highlight VindentIndentLevel ' .. g:vindent_color
		exe 'match VindentIndentLevel ' .. l:pattern
	endif
endfunction

nnoremap <Plug>(VindentMotion_next_diff) :<C-U>call                                        vindent#Motion('next',1,'Diff','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_next_less) :<C-U>call                                        vindent#Motion('next',1,'Less','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_next_more) :<C-U>call                                        vindent#Motion('next',1,'More','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_next_same) :<C-U>call                                        vindent#Motion('next',1,'Same','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_prev_diff) :<C-U>call                                        vindent#Motion('prev',1,'Diff','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_prev_less) :<C-U>call                                        vindent#Motion('prev',1,'Less','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_prev_more) :<C-U>call                                        vindent#Motion('prev',1,'More','N',v:count1)<CR>
nnoremap <Plug>(VindentMotion_prev_same) :<C-U>call                                        vindent#Motion('prev',1,'Same','N',v:count1)<CR>
onoremap <Plug>(VindentMotion_next_diff) :<C-U>call                                        vindent#Motion('next',1,'Diff','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_next_less) :<C-U>call                                        vindent#Motion('next',1,'Less','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_next_more) :<C-U>call                                        vindent#Motion('next',1,'More','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_next_same) :<C-U>call                                        vindent#Motion('next',1,'Same','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_prev_diff) :<C-U>call                                        vindent#Motion('prev',1,'Diff','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_prev_less) :<C-U>call                                        vindent#Motion('prev',1,'Less','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_prev_more) :<C-U>call                                        vindent#Motion('prev',1,'More','O',v:count1)<CR>
onoremap <Plug>(VindentMotion_prev_same) :<C-U>call                                        vindent#Motion('prev',1,'Same','O',v:count1)<CR>
xnoremap <Plug>(VindentMotion_next_diff) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('next',1,'Diff','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_next_less) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('next',1,'Less','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_next_more) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('next',1,'More','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_next_same) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('next',1,'Same','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_prev_diff) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('prev',1,'Diff','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_prev_less) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('prev',1,'Less','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_prev_more) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('prev',1,'More','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentMotion_prev_same) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#Motion('prev',1,'Same','X',g:vindent_temp)<CR>

if exists("g:vindent_motion_same_prev") | exe "map <silent> " .. g:vindent_motion_same_prev .. " <Plug>(VindentMotion_prev_same)" | endif
if exists("g:vindent_motion_same_next") | exe "map <silent> " .. g:vindent_motion_same_next .. " <Plug>(VindentMotion_next_same)" | endif
if exists("g:vindent_motion_less_prev") | exe "map <silent> " .. g:vindent_motion_less_prev .. " <Plug>(VindentMotion_prev_less)" | endif
if exists("g:vindent_motion_less_next") | exe "map <silent> " .. g:vindent_motion_less_next .. " <Plug>(VindentMotion_next_less)" | endif
if exists("g:vindent_motion_more_prev") | exe "map <silent> " .. g:vindent_motion_more_prev .. " <Plug>(VindentMotion_prev_more)" | endif
if exists("g:vindent_motion_more_next") | exe "map <silent> " .. g:vindent_motion_more_next .. " <Plug>(VindentMotion_next_more)" | endif
if exists("g:vindent_motion_diff_prev") | exe "map <silent> " .. g:vindent_motion_diff_prev .. " <Plug>(VindentMotion_prev_diff)" | endif
if exists("g:vindent_motion_diff_next") | exe "map <silent> " .. g:vindent_motion_diff_next .. " <Plug>(VindentMotion_next_diff)" | endif

nnoremap <Plug>(VindentBlockMotion_OO_next) :<C-U>call                                        vindent#BlockMotion('next',0,'Same','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_OO_prev) :<C-U>call                                        vindent#BlockMotion('prev',0,'Same','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_OX_next) :<C-U>call                                        vindent#BlockMotion('next',0,'NoLe','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_OX_prev) :<C-U>call                                        vindent#BlockMotion('prev',0,'NoLe','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_XO_next) :<C-U>call                                        vindent#BlockMotion('next',1,'Same','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_XO_prev) :<C-U>call                                        vindent#BlockMotion('prev',1,'Same','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_XX_next) :<C-U>call                                        vindent#BlockMotion('next',1,'NoLe','N',v:count1)<CR>
nnoremap <Plug>(VindentBlockMotion_XX_prev) :<C-U>call                                        vindent#BlockMotion('prev',1,'NoLe','N',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_OO_next) :<C-U>call                                        vindent#BlockMotion('next',0,'Same','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_OO_prev) :<C-U>call                                        vindent#BlockMotion('prev',0,'Same','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_OX_next) :<C-U>call                                        vindent#BlockMotion('next',0,'NoLe','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_OX_prev) :<C-U>call                                        vindent#BlockMotion('prev',0,'NoLe','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_XO_next) :<C-U>call                                        vindent#BlockMotion('next',1,'Same','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_XO_prev) :<C-U>call                                        vindent#BlockMotion('prev',1,'Same','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_XX_next) :<C-U>call                                        vindent#BlockMotion('next',1,'NoLe','O',v:count1)<CR>
onoremap <Plug>(VindentBlockMotion_XX_prev) :<C-U>call                                        vindent#BlockMotion('prev',1,'NoLe','O',v:count1)<CR>
xnoremap <Plug>(VindentBlockMotion_OO_next) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('next',0,'Same','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_OO_prev) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('prev',0,'Same','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_OX_next) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('next',0,'NoLe','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_OX_prev) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('prev',0,'NoLe','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_XO_next) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('next',1,'Same','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_XO_prev) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('prev',1,'Same','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_XX_next) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('next',1,'NoLe','X',g:vindent_temp)<CR>
xnoremap <Plug>(VindentBlockMotion_XX_prev) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockMotion('prev',1,'NoLe','X',g:vindent_temp)<CR>

if exists("g:vindent_motion_XO_prev") | exe "map <silent> " .. g:vindent_motion_XO_prev .. " <Plug>(VindentBlockMotion_XO_prev)" | endif
if exists("g:vindent_motion_XO_next") | exe "map <silent> " .. g:vindent_motion_XO_next .. " <Plug>(VindentBlockMotion_XO_next)" | endif
if exists("g:vindent_motion_OO_prev") | exe "map <silent> " .. g:vindent_motion_OO_prev .. " <Plug>(VindentBlockMotion_OO_prev)" | endif
if exists("g:vindent_motion_OO_next") | exe "map <silent> " .. g:vindent_motion_OO_next .. " <Plug>(VindentBlockMotion_OO_next)" | endif
if exists("g:vindent_motion_XX_prev") | exe "map <silent> " .. g:vindent_motion_XX_prev .. " <Plug>(VindentBlockMotion_XX_prev)" | endif
if exists("g:vindent_motion_XX_next") | exe "map <silent> " .. g:vindent_motion_XX_next .. " <Plug>(VindentBlockMotion_XX_next)" | endif
if exists("g:vindent_motion_OX_prev") | exe "map <silent> " .. g:vindent_motion_OX_prev .. " <Plug>(VindentBlockMotion_OX_prev)" | endif
if exists("g:vindent_motion_OX_next") | exe "map <silent> " .. g:vindent_motion_OX_next .. " <Plug>(VindentBlockMotion_OX_next)" | endif

nnoremap <Plug>(VindentBlockMotion_OO_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',0,'Same','N')<CR>
nnoremap <Plug>(VindentBlockMotion_OO_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',0,'Same','N')<CR>
nnoremap <Plug>(VindentBlockMotion_OX_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',0,'NoLe','N')<CR>
nnoremap <Plug>(VindentBlockMotion_OX_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',0,'NoLe','N')<CR>
nnoremap <Plug>(VindentBlockMotion_XO_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',1,'Same','N')<CR>
nnoremap <Plug>(VindentBlockMotion_XO_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',1,'Same','N')<CR>
nnoremap <Plug>(VindentBlockMotion_XX_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',1,'NoLe','N')<CR>
nnoremap <Plug>(VindentBlockMotion_XX_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',1,'NoLe','N')<CR>
onoremap <Plug>(VindentBlockMotion_OO_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',0,'Same','O')<CR>
onoremap <Plug>(VindentBlockMotion_OO_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',0,'Same','O')<CR>
onoremap <Plug>(VindentBlockMotion_OX_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',0,'NoLe','O')<CR>
onoremap <Plug>(VindentBlockMotion_OX_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',0,'NoLe','O')<CR>
onoremap <Plug>(VindentBlockMotion_XO_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',1,'Same','O')<CR>
onoremap <Plug>(VindentBlockMotion_XO_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',1,'Same','O')<CR>
onoremap <Plug>(VindentBlockMotion_XX_se) :<C-U>call                                        vindent#BlockEdgeMotion('next',1,'NoLe','O')<CR>
onoremap <Plug>(VindentBlockMotion_XX_ss) :<C-U>call                                        vindent#BlockEdgeMotion('prev',1,'NoLe','O')<CR>
xnoremap <Plug>(VindentBlockMotion_OO_se) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('next',0,'Same','X')<CR>
xnoremap <Plug>(VindentBlockMotion_OO_ss) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('prev',0,'Same','X')<CR>
xnoremap <Plug>(VindentBlockMotion_OX_se) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('next',0,'NoLe','X')<CR>
xnoremap <Plug>(VindentBlockMotion_OX_ss) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('prev',0,'NoLe','X')<CR>
xnoremap <Plug>(VindentBlockMotion_XO_se) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('next',1,'Same','X')<CR>
xnoremap <Plug>(VindentBlockMotion_XO_ss) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('prev',1,'Same','X')<CR>
xnoremap <Plug>(VindentBlockMotion_XX_se) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('next',1,'NoLe','X')<CR>
xnoremap <Plug>(VindentBlockMotion_XX_ss) :<C-U>let g:vindent_temp=v:count1<CR>gv<Esc>:call vindent#BlockEdgeMotion('prev',1,'NoLe','X')<CR>

if exists("g:vindent_motion_OO_ss") | exe "map <silent> " .. g:vindent_motion_OO_ss .. " <Plug>(VindentBlockMotion_OO_ss)" | endif
if exists("g:vindent_motion_OO_se") | exe "map <silent> " .. g:vindent_motion_OO_se .. " <Plug>(VindentBlockMotion_OO_se)" | endif
if exists("g:vindent_motion_OX_ss") | exe "map <silent> " .. g:vindent_motion_OX_ss .. " <Plug>(VindentBlockMotion_OX_ss)" | endif
if exists("g:vindent_motion_OX_se") | exe "map <silent> " .. g:vindent_motion_OX_se .. " <Plug>(VindentBlockMotion_OX_se)" | endif
if exists("g:vindent_motion_XO_ss") | exe "map <silent> " .. g:vindent_motion_XO_ss .. " <Plug>(VindentBlockMotion_XO_ss)" | endif
if exists("g:vindent_motion_XO_se") | exe "map <silent> " .. g:vindent_motion_XO_se .. " <Plug>(VindentBlockMotion_XO_se)" | endif
if exists("g:vindent_motion_XX_ss") | exe "map <silent> " .. g:vindent_motion_XX_ss .. " <Plug>(VindentBlockMotion_XX_ss)" | endif
if exists("g:vindent_motion_XX_se") | exe "map <silent> " .. g:vindent_motion_XX_se .. " <Plug>(VindentBlockMotion_XX_se)" | endif

exe "onoremap <Plug>(VindentObject_OO_aI) :<C-U>call vindent#Object(0,'Same','aI',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_OO_ai) :<C-U>call vindent#Object(0,'Same','ai',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_OO_ii) :<C-U>call vindent#Object(0,'Same','ii',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_OX_aI) :<C-U>call vindent#Object(0,'NoLe','aI',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_OX_ai) :<C-U>call vindent#Object(0,'NoLe','ai',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_OX_ii) :<C-U>call vindent#Object(0,'NoLe','ii',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_XO_aI) :<C-U>call vindent#Object(1,'Same','aI',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_XO_ai) :<C-U>call vindent#Object(1,'Same','ai',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_XO_ii) :<C-U>call vindent#Object(1,'Same','ii',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_XX_aI) :<C-U>call vindent#Object(1,'NoLe','aI',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_XX_ai) :<C-U>call vindent#Object(1,'NoLe','ai',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "onoremap <Plug>(VindentObject_XX_ii) :<C-U>call vindent#Object(1,'NoLe','ii',v:count" .. ( g:vindent_count ? "1" : "" ) .. ")<CR>"
exe "xnoremap <Plug>(VindentObject_OO_aI) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(0,'Same','aI',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_OO_ai) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(0,'Same','ai',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_OO_ii) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(0,'Same','ii',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_OX_aI) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(0,'NoLe','aI',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_OX_ai) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(0,'NoLe','ai',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_OX_ii) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(0,'NoLe','ii',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_XO_aI) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(1,'Same','aI',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_XO_ai) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(1,'Same','ai',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_XO_ii) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(1,'Same','ii',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_XX_aI) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(1,'NoLe','aI',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_XX_ai) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(1,'NoLe','ai',g:vindent_temp)<CR>"
exe "xnoremap <Plug>(VindentObject_XX_ii) :<C-U>let g:vindent_temp=v:count" .. ( g:vindent_count ? "1" : "" ) .. "<CR>gv<Esc>:call vindent#Object(1,'NoLe','ii',g:vindent_temp)<CR>"

if exists("g:vindent_object_OO_ii") | exe "xmap <silent> " .. g:vindent_object_OO_ii .. " <Plug>(VindentObject_OO_ii)" | exe "omap <silent> " .. g:vindent_object_OO_ii .. " <Plug>(VindentObject_OO_ii)" | endif
if exists("g:vindent_object_OX_ii") | exe "xmap <silent> " .. g:vindent_object_OX_ii .. " <Plug>(VindentObject_OX_ii)" | exe "omap <silent> " .. g:vindent_object_OX_ii .. " <Plug>(VindentObject_OX_ii)" | endif
if exists("g:vindent_object_XO_ii") | exe "xmap <silent> " .. g:vindent_object_XO_ii .. " <Plug>(VindentObject_XO_ii)" | exe "omap <silent> " .. g:vindent_object_XO_ii .. " <Plug>(VindentObject_XO_ii)" | endif
if exists("g:vindent_object_XX_ii") | exe "xmap <silent> " .. g:vindent_object_XX_ii .. " <Plug>(VindentObject_XX_ii)" | exe "omap <silent> " .. g:vindent_object_XX_ii .. " <Plug>(VindentObject_XX_ii)" | endif
if exists("g:vindent_object_OO_ai") | exe "xmap <silent> " .. g:vindent_object_OO_ai .. " <Plug>(VindentObject_OO_ai)" | exe "omap <silent> " .. g:vindent_object_OO_ai .. " <Plug>(VindentObject_OO_ai)" | endif
if exists("g:vindent_object_OX_ai") | exe "xmap <silent> " .. g:vindent_object_OX_ai .. " <Plug>(VindentObject_OX_ai)" | exe "omap <silent> " .. g:vindent_object_OX_ai .. " <Plug>(VindentObject_OX_ai)" | endif
if exists("g:vindent_object_XO_ai") | exe "xmap <silent> " .. g:vindent_object_XO_ai .. " <Plug>(VindentObject_XO_ai)" | exe "omap <silent> " .. g:vindent_object_XO_ai .. " <Plug>(VindentObject_XO_ai)" | endif
if exists("g:vindent_object_XX_ai") | exe "xmap <silent> " .. g:vindent_object_XX_ai .. " <Plug>(VindentObject_XX_ai)" | exe "omap <silent> " .. g:vindent_object_XX_ai .. " <Plug>(VindentObject_XX_ai)" | endif
if exists("g:vindent_object_OO_aI") | exe "xmap <silent> " .. g:vindent_object_OO_aI .. " <Plug>(VindentObject_OO_aI)" | exe "omap <silent> " .. g:vindent_object_OO_aI .. " <Plug>(VindentObject_OO_aI)" | endif
if exists("g:vindent_object_OX_aI") | exe "xmap <silent> " .. g:vindent_object_OX_aI .. " <Plug>(VindentObject_OX_aI)" | exe "omap <silent> " .. g:vindent_object_OX_aI .. " <Plug>(VindentObject_OX_aI)" | endif
if exists("g:vindent_object_XO_aI") | exe "xmap <silent> " .. g:vindent_object_XO_aI .. " <Plug>(VindentObject_XO_aI)" | exe "omap <silent> " .. g:vindent_object_XO_aI .. " <Plug>(VindentObject_XO_aI)" | endif
if exists("g:vindent_object_XX_aI") | exe "xmap <silent> " .. g:vindent_object_XX_aI .. " <Plug>(VindentObject_XX_aI)" | exe "omap <silent> " .. g:vindent_object_XX_aI .. " <Plug>(VindentObject_XX_aI)" | endif

let &cpo = s:save_cpo | unlet s:save_cpo | let g:loaded_vindent=1

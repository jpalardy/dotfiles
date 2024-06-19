" autoload/vindent.vim

" Test if line is empty, valid.
let s:empty = { line -> empty(getline(line)) }
let s:valid = { line -> line>=1 && line<=line("$") }

" Compare indentation levels.
let s:compare = {
			\ "Same": { indent,base_indent -> indent == base_indent },
			\ "NoLe": { indent,base_indent -> indent >= base_indent },
			\ "Less": { indent,base_indent -> indent <  base_indent },
			\ "More": { indent,base_indent -> indent >  base_indent },
			\ "Diff": { indent,base_indent -> indent != base_indent },
			\ }

" Remove hanging blank lines.
let s:nohang = {
			\ "prev": { line -> nextnonblank(line) },
			\ "next": { line -> prevnonblank(line) },
			\ }

" Get indentation of line.
let s:indent = { line -> s:empty(line) ? -1 : indent(line) }
let s:is_block_ending = { line -> getline(line) =~# '^\s*\(' .. join(g:vindent_block_ending, '\|') .. '\)'}
function! <SID>get_indent(line, infer=g:vindent_infer)
	if !a:infer || !s:empty(a:line) | return s:indent(a:line) | endif
	let l:line_prev = prevnonblank(a:line)
	let l:line_next = nextnonblank(a:line)
	if !exists("g:vindent_block_ending")
		let l:indent_prev = s:valid(l:line_prev) ? indent(l:line_prev) : 0
		let l:indent_next = s:valid(l:line_next) ? indent(l:line_next) : 0
		let l:indent = max([l:indent_prev, l:indent_next])
		return l:indent==0 ? -1 : l:indent
	else
		if !s:valid(l:line_next) | return -1 | endif
		if s:is_block_ending(l:line_next)
			if !s:valid(l:line_prev) | return indent(l:line_next) | endif
			return max([indent(l:line_next), min([indent(l:line_next)+shiftwidth(), indent(l:line_prev)])])
		else
			return indent(l:line_next)==0 ? -1 : indent(l:line_next)
		endif
	endif
endfunction

" Find prev/next line until criteria "func" is met.
function! <SID>find_til(direct, func, skip, line, base=a:line)
	let l:indent = <SID>get_indent(a:base)
	let [ l:line, l:inc ] = [ a:line, ( a:direct=="prev" ? -1 : 1 ) ]
	while 1 | let l:line += l:inc
		if !s:valid(l:line)                             | return a:line | endif
		if a:skip && s:empty(l:line)                    | continue      | endif
		if s:compare[a:func](s:indent(l:line),l:indent) | return l:line | endif
	endwhile
endfunction

" Find prev/next line until criteria "func" is NOT met.
function! <SID>find_til_not(direct, func, skip, line, base=a:line)
	let l:indent = <SID>get_indent(a:base)
	let [ l:line, l:inc ] = [ a:line, ( a:direct=="prev" ? -1 : 1 ) ]
	while 1 | let l:line += l:inc
		if !s:valid(l:line)                              | return l:line-l:inc | endif
		if a:skip && s:empty(l:line)                     | continue            | endif
		if !s:compare[a:func](s:indent(l:line),l:indent) | return l:line-l:inc | endif
	endwhile
endfunction

" Actually move the cursor according to inputs. (motion)
function! <SID>do_motion(direct, mode, diff)
	let l:move = a:diff .. ( a:direct=="prev" ? "k" : "j" )
	let l:marker = g:vindent_jumps ? "m'" : ""
	let l:final = g:vindent_begin ? "_" : ""
	if     a:mode=="N" | exe a:diff==0 ? "norm! lh" .. l:final : "norm! "   .. l:marker .. ""   .. l:move .. l:final
	elseif a:mode=="X" | exe a:diff==0 ? "norm! gv"            : "norm! \e" .. l:marker .. "gv" .. l:move .. l:final
	elseif a:mode=="O" | exe a:diff==0 ? "norm! V"             : "norm! "   .. l:marker .. "V"  .. l:move .. l:final
	endif
endfunction

" Actually move the cursor according to inputs. (text object)
function! <SID>do_object(range)
	call cursor(a:range[0],0)
	exec { x -> "norm! V" .. ( x==0 ? "" : x .. "j" ) }( a:range[1] - a:range[0] )
endfunction

" Vindent Motion: Go to the "prev" or "next" line with the same indentation.
function! vindent#Motion(direct, skip, func, mode, count)
	let [ l:line, l:to ] = [ line("."), line(".") ]
	for l:time in range(a:count)
		let l:to = <SID>find_til(a:direct, a:func, a:skip, l:to)
	endfor
	if g:vindent_noisy && l:line==l:to | throw "Motion Not Applicable" | endif
	call <SID>do_motion(a:direct, a:mode, abs(l:line-l:to))
endfunction

" Vindent Block Motion: Move to the next block with same indentation.
function! vindent#BlockMotion(direct, skip, func, mode, count)
	let [ l:line, l:to ] = [ line("."), line(".") ]
	for l:time in range(a:count)
		let l:edge = <SID>find_til_not(a:direct,a:func,a:skip,l:to)
		let l:to   = <SID>find_til(a:direct,"Same",a:skip,l:edge,l:to)
	endfor
	if g:vindent_noisy && l:line==l:to | throw "Motion Not Applicable" | endif
	call <SID>do_motion(a:direct, a:mode, abs(l:line-l:to))
endfunction

" Vindent Block Motion Edge: Move to the edge of same indentation block.
function! vindent#BlockEdgeMotion(direct, skip, func, mode)
	let l:line = line(".")
	let l:edge = s:nohang[a:direct](<SID>find_til_not(a:direct,a:func,a:skip,l:line))
	call <SID>do_motion(a:direct, a:mode, abs(l:line-l:edge))
endfunction

" Vindent Text Object: Select indent text objects.
function! vindent#Object(skip, func, code, count)
	let l:get_range = { "full": { line1,line2 -> [
				\ <SID>find_til_not("prev",a:func,a:skip,line1),
				\ <SID>find_til_not("next",a:func,a:skip,line2)] } }
	let l:line = line(".")
	let l:full_range = l:get_range.full(l:line,l:line)
	let l:range = [ s:nohang.prev(l:full_range[0]), s:nohang.next(l:full_range[1]) ]
	for l:time in range( a:count - ( g:vindent_count ? 1 : 0 ) )
		let l:test = [
					\ { x,y -> s:compare.Less(s:indent(x),s:indent(y)) && s:valid(x) && !s:empty(x) ? x : y }( l:full_range[0]-1,l:range[0] ),
					\ { x,y -> s:compare.Less(s:indent(x),s:indent(y)) && s:valid(x) && !s:empty(x) ? x : y }( l:full_range[1]+1,l:range[1] )]
		if l:test[0]!=l:range[0] && l:test[1]!=l:range[1]
			if     s:compare.More(s:indent(l:test[0]),s:indent(l:test[1])) | let l:test[1]=l:range[1]
			elseif s:compare.Less(s:indent(l:test[0]),s:indent(l:test[1])) | let l:test[0]=l:range[0]
			endif
		endif
		let l:full_range = l:get_range.full(l:test[0],l:test[1])
		let l:range = [ s:nohang.prev(l:full_range[0]), s:nohang.next(l:full_range[1]) ]
	endfor
	if a:code[0]==#"a" | let l:range[0]=<SID>find_til("prev","Less",1,l:range[0]) | endif
	if a:code[1]==#"I" | let l:range[1]=<SID>find_til("next","Less",1,l:range[1]) | endif
	call <SID>do_object(l:range)
endfunction

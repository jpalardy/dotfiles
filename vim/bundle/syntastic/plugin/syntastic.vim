"============================================================================
"File:        syntastic.vim
"Description: Vim plugin for on the fly syntax checking.
"Version:     3.0.0
"Released On: 13 April, 2013
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_plugin")
    finish
endif
let g:loaded_syntastic_plugin = 1

runtime! plugin/syntastic/*.vim

let s:running_windows = has("win16") || has("win32")

if !exists("g:syntastic_always_populate_loc_list")
    let g:syntastic_always_populate_loc_list = 0
endif

if !exists("g:syntastic_auto_jump")
    let syntastic_auto_jump=0
endif

if !exists("g:syntastic_quiet_warnings")
    let g:syntastic_quiet_warnings = 0
endif

if !exists("g:syntastic_stl_format")
    let g:syntastic_stl_format = '[Syntax: line:%F (%t)]'
endif

if !exists("g:syntastic_check_on_open")
    let g:syntastic_check_on_open = 0
endif

if !exists("g:syntastic_loc_list_height")
    let g:syntastic_loc_list_height = 10
endif

let s:registry = g:SyntasticRegistry.Instance()
let s:notifiers = g:SyntasticNotifiers.New()
let s:modemap = g:SyntasticModeMap.Instance()

function! s:CompleteCheckerName(argLead, cmdLine, cursorPos)
    let checker_names = []
    for ft in s:CurrentFiletypes()
        for checker in s:registry.availableCheckersFor(ft)
            call add(checker_names, checker.name())
        endfor
    endfor
    return join(checker_names, "\n")
endfunction

command! SyntasticToggleMode call s:ToggleMode()
command! -nargs=? -complete=custom,s:CompleteCheckerName SyntasticCheck call s:UpdateErrors(0, <f-args>) <bar> call s:Redraw()
command! Errors call s:ShowLocList()
command! SyntasticInfo call s:registry.echoInfoFor(&ft)

highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

augroup syntastic
    autocmd BufReadPost * if g:syntastic_check_on_open | call s:UpdateErrors(1) | endif
    autocmd BufWritePost * call s:UpdateErrors(1)

    autocmd BufWinEnter * if empty(&bt) | call g:SyntasticAutoloclistNotifier.AutoToggle(g:SyntasticLoclist.Current()) | endif

    " TODO: the next autocmd should be "autocmd BufWinLeave * if empty(&bt) | lclose | endif"
    " but in recent versions of Vim lclose can no longer be called from BufWinLeave
    autocmd BufEnter * call s:BufWinLeaveCleanup()
augroup END

if v:version > 703 || (v:version == 703 && has('patch544'))
    " QuitPre was added in Vim 7.3.544
    augroup syntastic
        autocmd QuitPre * call g:SyntasticLoclistHide()
    augroup END
endif


function! s:BufWinLeaveCleanup()
    " TODO: at this point there is no b:syntastic_loclist
    let loclist = filter(getloclist(0), 'v:val["valid"] == 1')
    let buffers = syntastic#util#unique(map( loclist, 'v:val["bufnr"]' ))
    if &bt=='quickfix' && !empty(loclist) && empty(filter( buffers, 'syntastic#util#bufIsActive(v:val)' ))
        call g:SyntasticLoclistHide()
    endif
endfunction

"refresh and redraw all the error info for this buf when saving or reading
function! s:UpdateErrors(auto_invoked, ...)
    if s:SkipFile()
        return
    endif

    if !a:auto_invoked || s:modemap.allowsAutoChecking(&filetype)
        if a:0 >= 1
            call s:CacheErrors(a:1)
        else
            call s:CacheErrors()
        endif
    end

    let loclist = g:SyntasticLoclist.Current()
    call s:notifiers.refresh(loclist)

    if (g:syntastic_always_populate_loc_list || g:syntastic_auto_jump) && loclist.hasErrorsOrWarningsToDisplay()
        call setloclist(0, loclist.filteredRaw())
        if g:syntastic_auto_jump
            silent! ll
        endif
    endif
endfunction

"clear the loc list for the buffer
function! s:ClearCache()
    call s:notifiers.reset(g:SyntasticLoclist.Current())
    unlet! b:syntastic_loclist
endfunction

function! s:CurrentFiletypes()
    "sub - for _ in filetypes otherwise we cant name syntax checker
    "functions legally for filetypes like "gentoo-metadata"
    let fts = substitute(&ft, '-', '_', 'g')
    return split(fts, '\.')
endfunction

"detect and cache all syntax errors in this buffer
function! s:CacheErrors(...)
    call s:ClearCache()
    let newLoclist = g:SyntasticLoclist.New([])

    if !s:SkipFile()
        for ft in s:CurrentFiletypes()

            if a:0
                let checker = s:registry.getChecker(ft, a:1)
                if !empty(checker)
                    let checkers = [checker]
                endif
            else
                let checkers = s:registry.getActiveCheckers(ft)
            endif

            for checker in checkers
                call syntastic#util#debug("CacheErrors: Invoking checker: " . checker.name())

                let loclist = checker.getLocList()

                if !loclist.isEmpty()
                    let newLoclist = newLoclist.extend(loclist)

                    "only get errors from one checker at a time
                    break
                endif
            endfor
        endfor
    endif

    let b:syntastic_loclist = newLoclist
endfunction

function! s:ToggleMode()
    call s:modemap.toggleMode()
    call s:ClearCache()
    call s:UpdateErrors(1)
    call s:modemap.echoMode()
endfunction

"display the cached errors for this buf in the location list
function! s:ShowLocList()
    let loclist = g:SyntasticLoclist.Current()
    call loclist.show()
endfunction

"the script changes &shellpipe and &shell to stop the screen flicking when
"shelling out to syntax checkers. Not all OSs support the hacks though
function! s:OSSupportsShellpipeHack()
    return !s:running_windows && executable('/bin/bash') && (s:uname() !~ "FreeBSD") && (s:uname() !~ "OpenBSD")
endfunction

function! s:IsRedrawRequiredAfterMake()
    return !s:running_windows && (s:uname() =~ "FreeBSD" || s:uname() =~ "OpenBSD")
endfunction

"Redraw in a way that doesnt make the screen flicker or leave anomalies behind.
"
"Some terminal versions of vim require `redraw!` - otherwise there can be
"random anomalies left behind.
"
"However, on some versions of gvim using `redraw!` causes the screen to
"flicker - so use redraw.
function! s:Redraw()
    if has('gui_running') || has('gui_macvim')
        redraw
    else
        redraw!
    endif
endfunction

" Skip running in special buffers
function! s:SkipFile()
    return !empty(&buftype) || !filereadable(expand('%')) || getwinvar(0, '&diff')
endfunction

function! s:uname()
    if !exists('s:uname')
        let s:uname = system('uname')
    endif
    return s:uname
endfunction

"return a string representing the state of buffer according to
"g:syntastic_stl_format
"
"return '' if no errors are cached for the buffer
function! SyntasticStatuslineFlag()
    let loclist = g:SyntasticLoclist.Current()
    if loclist.hasErrorsOrWarningsToDisplay()
        let errors = loclist.errors()
        let warnings = loclist.warnings()

        let num_errors = len(errors)
        let num_warnings = len(warnings)

        let output = g:syntastic_stl_format

        "hide stuff wrapped in %E(...) unless there are errors
        let output = substitute(output, '\C%E{\([^}]*\)}', num_errors ? '\1' : '' , 'g')

        "hide stuff wrapped in %W(...) unless there are warnings
        let output = substitute(output, '\C%W{\([^}]*\)}', num_warnings ? '\1' : '' , 'g')

        "hide stuff wrapped in %B(...) unless there are both errors and warnings
        let output = substitute(output, '\C%B{\([^}]*\)}', (num_warnings && num_errors) ? '\1' : '' , 'g')


        "sub in the total errors/warnings/both
        let output = substitute(output, '\C%w', num_warnings, 'g')
        let output = substitute(output, '\C%e', num_errors, 'g')
        let output = substitute(output, '\C%t', loclist.length(), 'g')

        "first error/warning line num
        let output = substitute(output, '\C%F', loclist.filteredRaw()[0]['lnum'], 'g')

        "first error line num
        let output = substitute(output, '\C%fe', num_errors ? errors[0]['lnum'] : '', 'g')

        "first warning line num
        let output = substitute(output, '\C%fw', num_warnings ? warnings[0]['lnum'] : '', 'g')

        return output
    else
        return ''
    endif
endfunction

"A wrapper for the :lmake command. Sets up the make environment according to
"the options given, runs make, resets the environment, returns the location
"list
"
"a:options can contain the following keys:
"    'makeprg'
"    'errorformat'
"
"The corresponding options are set for the duration of the function call. They
"are set with :let, so dont escape spaces.
"
"a:options may also contain:
"   'defaults' - a dict containing default values for the returned errors
"   'subtype' - all errors will be assigned the given subtype
function! SyntasticMake(options)
    call syntastic#util#debug('SyntasticMake: called with options: '. string(a:options))

    let old_loclist = getloclist(0)
    let old_makeprg = &l:makeprg
    let old_shellpipe = &shellpipe
    let old_shell = &shell
    let old_errorformat = &l:errorformat

    if s:OSSupportsShellpipeHack()
        "this is a hack to stop the screen needing to be ':redraw'n when
        "when :lmake is run. Otherwise the screen flickers annoyingly
        let &shellpipe='&>'
        let &shell = '/bin/bash'
    endif

    if has_key(a:options, 'makeprg')
        let &l:makeprg = a:options['makeprg']
    endif

    if has_key(a:options, 'errorformat')
        let &l:errorformat = a:options['errorformat']
    endif

    silent lmake!
    let errors = getloclist(0)

    call setloclist(0, old_loclist)
    let &l:makeprg = old_makeprg
    let &l:errorformat = old_errorformat
    let &shellpipe=old_shellpipe
    let &shell=old_shell

    if s:IsRedrawRequiredAfterMake()
        call s:Redraw()
    endif

    if has_key(a:options, 'defaults')
        call SyntasticAddToErrors(errors, a:options['defaults'])
    endif

    " Add subtype info if present.
    if has_key(a:options, 'subtype')
        call SyntasticAddToErrors(errors, {'subtype': a:options['subtype']})
    endif

    return errors
endfunction

"take a list of errors and add default values to them from a:options
function! SyntasticAddToErrors(errors, options)
    for i in range(0, len(a:errors)-1)
        for key in keys(a:options)
            if !has_key(a:errors[i], key) || empty(a:errors[i][key])
                let a:errors[i][key] = a:options[key]
            endif
        endfor
    endfor
    return a:errors
endfunction

" vim: set et sts=4 sw=4:

if exists("g:loaded_syntastic_c_autoload")
    finish
endif
let g:loaded_syntastic_c_autoload = 1

let s:save_cpo = &cpo
set cpo&vim

" Public functions {{{1

" convenience function to determine the 'null device' parameter
" based on the current operating system
function! syntastic#c#NullOutput()
    let known_os = has('win32') || has('unix') || has('mac')
    return known_os ? '-o ' . syntastic#util#DevNull() : ''
endfunction

" read additional compiler flags from the given configuration file
" the file format and its parsing mechanism is inspired by clang_complete
function! syntastic#c#ReadConfig(file)
    " search in the current file's directory upwards
    let config = findfile(a:file, '.;')
    if config == '' || !filereadable(config)
        return ''
    endif

    " convert filename into absolute path
    let filepath = fnamemodify(config, ':p:h')

    " try to read config file
    try
        let lines = readfile(config)
    catch /^Vim\%((\a\+)\)\=:E484/
        return ''
    endtry

    " filter out empty lines and comments
    call filter(lines, 'v:val !~ ''\v^(\s*#|$)''')

    " remove leading and trailing spaces
    call map(lines, 'substitute(v:val, ''^\s\+'', "", "")')
    call map(lines, 'substitute(v:val, ''\s\+$'', "", "")')

    let parameters = []
    for line in lines
        let matches = matchlist(line, '\C^\s*-I\s*\(\S\+\)')
        if matches != [] && matches[1] != ''
            " this one looks like an absolute path
            if match(matches[1], '^\%(/\|\a:\)') != -1
                call add(parameters, '-I' . matches[1])
            else
                call add(parameters, '-I' . filepath . syntastic#util#Slash() . matches[1])
            endif
        else
            call add(parameters, line)
        endif
    endfor

    return join(map(parameters, 'syntastic#util#shescape(fnameescape(v:val))'), ' ')
endfunction

" GetLocList() for C-like compilers
function! syntastic#c#GetLocList(filetype, subchecker, options)
    try
        let flags = s:GetCflags(a:filetype, a:subchecker, a:options)
    catch /\m\C^Syntastic: skip checks$/
        return []
    endtry

    let makeprg = g:syntastic_{a:filetype}_compiler . ' ' . flags . ' ' . syntastic#util#shexpand('%')

    let errorformat = s:GetCheckerVar('g', a:filetype, a:subchecker, 'errorformat', a:options['errorformat'])

    let postprocess = s:GetCheckerVar('g', a:filetype, a:subchecker, 'remove_include_errors', 0) ?
        \ ['filterForeignErrors'] : []

    " process makeprg
    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'postprocess': postprocess })
endfunction

" Private functions {{{1

" initialize c/cpp syntax checker handlers
function! s:Init()
    let s:handlers = []
    let s:cflags = {}

    call s:RegHandler('cairo',     'syntastic#c#CheckPKG', ['cairo', 'cairo'])
    call s:RegHandler('freetype',  'syntastic#c#CheckPKG', ['freetype', 'freetype2', 'freetype'])
    call s:RegHandler('glade',     'syntastic#c#CheckPKG', ['glade', 'libglade-2.0', 'libglade'])
    call s:RegHandler('glib',      'syntastic#c#CheckPKG', ['glib', 'glib-2.0', 'glib'])
    call s:RegHandler('gtk',       'syntastic#c#CheckPKG', ['gtk', 'gtk+-2.0', 'gtk+', 'glib-2.0', 'glib'])
    call s:RegHandler('libsoup',   'syntastic#c#CheckPKG', ['libsoup', 'libsoup-2.4', 'libsoup-2.2'])
    call s:RegHandler('libxml',    'syntastic#c#CheckPKG', ['libxml', 'libxml-2.0', 'libxml'])
    call s:RegHandler('pango',     'syntastic#c#CheckPKG', ['pango', 'pango'])
    call s:RegHandler('SDL',       'syntastic#c#CheckPKG', ['sdl', 'sdl'])
    call s:RegHandler('opengl',    'syntastic#c#CheckPKG', ['opengl', 'gl'])
    call s:RegHandler('webkit',    'syntastic#c#CheckPKG', ['webkit', 'webkit-1.0'])

    call s:RegHandler('php\.h',    'syntastic#c#CheckPhp',    [])
    call s:RegHandler('Python\.h', 'syntastic#c#CheckPython', [])
    call s:RegHandler('ruby',      'syntastic#c#CheckRuby',   [])
endfunction

" resolve checker-related user variables
function! s:GetCheckerVar(scope, filetype, subchecker, name, default)
    let prefix = a:scope . ':' . 'syntastic_'
    if exists(prefix . a:filetype . '_' . a:subchecker . '_' . a:name)
        return {a:scope}:syntastic_{a:filetype}_{a:subchecker}_{a:name}
    elseif exists(prefix . a:filetype . '_' . a:name)
        return {a:scope}:syntastic_{a:filetype}_{a:name}
    else
        return a:default
    endif
endfunction

" resolve user CFLAGS
function! s:GetCflags(ft, ck, opts)
    " determine whether to parse header files as well
    if has_key(a:opts, 'header_names') && expand('%') =~? a:opts['header_names']
        if s:GetCheckerVar('g', a:ft, a:ck, 'check_header', 0)
            let flags = get(a:opts, 'header_flags', '') . ' -c ' . syntastic#c#NullOutput()
        else
            " checking headers when check_header is unset: bail out
            throw 'Syntastic: skip checks'
        endif
    else
        let flags = get(a:opts, 'main_flags', '')
    endif

    let flags .= ' ' . s:GetCheckerVar('g', a:ft, a:ck, 'compiler_options', '') . ' ' . s:GetIncludeDirs(a:ft)

    " check if the user manually set some cflags
    let b_cflags = s:GetCheckerVar('b', a:ft, a:ck, 'cflags', '')
    if b_cflags == ''
        " check whether to search for include files at all
        if !s:GetCheckerVar('g', a:ft, a:ck, 'no_include_search', 0)
            if a:ft ==# 'c' || a:ft ==# 'cpp'
                " refresh the include file search if desired
                if s:GetCheckerVar('g', a:ft, a:ck, 'auto_refresh_includes', 0)
                    let flags .= ' ' . s:SearchHeaders()
                else
                    " search for header includes if not cached already
                    if !exists('b:syntastic_' . a:ft . '_includes')
                        let b:syntastic_{a:ft}_includes = s:SearchHeaders()
                    endif
                    let flags .= ' ' . b:syntastic_{a:ft}_includes
                endif
            endif
        endif
    else
        " user-defined cflags
        let flags .= ' ' . b_cflags
    endif

    " add optional config file parameters
    let config_file = s:GetCheckerVar('g', a:ft, a:ck, 'config_file', '.syntastic_' . a:ft . '_config')
    let flags .= ' ' . syntastic#c#ReadConfig(config_file)

    return flags
endfunction

" get the gcc include directory argument depending on the default
" includes and the optional user-defined 'g:syntastic_c_include_dirs'
function! s:GetIncludeDirs(filetype)
    let include_dirs = []

    if a:filetype =~# '\v^%(c|cpp|d|objc|objcpp)$' &&
                \ (!exists('g:syntastic_'.a:filetype.'_no_default_include_dirs') ||
                \ !g:syntastic_{a:filetype}_no_default_include_dirs)
        let include_dirs = copy(s:default_includes)
    endif

    if exists('g:syntastic_'.a:filetype.'_include_dirs')
        call extend(include_dirs, g:syntastic_{a:filetype}_include_dirs)
    endif

    return join(map(syntastic#util#unique(include_dirs), 'syntastic#util#shescape(fnameescape("-I" . v:val))'), ' ')
endfunction

" search the first 100 lines for include statements that are
" given in the handlers dictionary
function! s:SearchHeaders()
    let includes = ''
    let files = []
    let found = []
    let lines = filter(getline(1, 100), 'v:val =~# "^\s*#\s*include"')

    " search current buffer
    for line in lines
        let file = matchstr(line, '"\zs\S\+\ze"')
        if file != ''
            call add(files, file)
            continue
        endif

        for handler in s:handlers
            if line =~# handler["regex"]
                let includes .= call(handler["func"], handler["args"])
                call add(found, handler["regex"])
                break
            endif
        endfor
    endfor

    " search included headers
    for hfile in files
        if hfile != ''
            let filename = expand('%:p:h') . syntastic#util#Slash() . hfile

            try
                let lines = readfile(filename, '', 100)
            catch /^Vim\%((\a\+)\)\=:E484/
                continue
            endtry

            let lines = filter(lines, 'v:val =~# "^\s*#\s*include"')

            for handler in s:handlers
                if index(found, handler["regex"]) != -1
                    continue
                endif

                for line in lines
                    if line =~# handler["regex"]
                        let includes .= call(handler["func"], handler["args"])
                        call add(found, handler["regex"])
                        break
                    endif
                endfor
            endfor
        endif
    endfor

    return includes
endfunction

" try to find library with 'pkg-config'
" search possible libraries from first to last given
" argument until one is found
function! syntastic#c#CheckPKG(name, ...)
    if executable('pkg-config')
        if !has_key(s:cflags, a:name)
            for pkg in a:000
                let pkg_flags = system('pkg-config --cflags ' . pkg)
                " since we cannot necessarily trust the pkg-config exit code
                " we have to check for an error output as well
                if v:shell_error == 0 && pkg_flags !~? 'not found'
                    let pkg_flags = ' ' . substitute(pkg_flags, "\n", '', '')
                    let s:cflags[a:name] = pkg_flags
                    return pkg_flags
                endif
            endfor
        else
            return s:cflags[a:name]
        endif
    endif
    return ''
endfunction

" try to find PHP includes with 'php-config'
function! syntastic#c#CheckPhp()
    if executable('php-config')
        if !has_key(s:cflags, 'php')
            let s:cflags['php'] = system('php-config --includes')
            let s:cflags['php'] = ' ' . substitute(s:cflags['php'], "\n", '', '')
        endif
        return s:cflags['php']
    endif
    return ''
endfunction

" try to find the ruby headers with 'rbconfig'
function! syntastic#c#CheckRuby()
    if executable('ruby')
        if !has_key(s:cflags, 'ruby')
            let s:cflags['ruby'] = system('ruby -r rbconfig -e ' .
                \ '''puts RbConfig::CONFIG["rubyhdrdir"] || RbConfig::CONFIG["archdir"]''')
            let s:cflags['ruby'] = substitute(s:cflags['ruby'], "\n", '', '')
            let s:cflags['ruby'] = ' -I' . s:cflags['ruby']
        endif
        return s:cflags['ruby']
    endif
    return ''
endfunction

" try to find the python headers with distutils
function! syntastic#c#CheckPython()
    if executable('python')
        if !has_key(s:cflags, 'python')
            let s:cflags['python'] = system('python -c ''from distutils import ' .
                \ 'sysconfig; import sys; sys.stdout.write(sysconfig.get_python_inc())''')
            let s:cflags['python'] = substitute(s:cflags['python'], "\n", '', '')
            let s:cflags['python'] = ' -I' . s:cflags['python']
        endif
        return s:cflags['python']
    endif
    return ''
endfunction

" return a handler dictionary object
function! s:RegHandler(regex, function, args)
    let handler = {}
    let handler["regex"] = a:regex
    let handler["func"] = function(a:function)
    let handler["args"] = a:args
    call add(s:handlers, handler)
endfunction

" }}}1

" default include directories
let s:default_includes = [
    \ '.',
    \ '..',
    \ 'include',
    \ 'includes',
    \ '..' . syntastic#util#Slash() . 'include',
    \ '..' . syntastic#util#Slash() . 'includes' ]

call s:Init()

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4 fdm=marker:

"============================================================================
"File:        twig.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Alexander <iam.asm89 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

function! SyntaxCheckers_twig_GetHighlightRegex(item)
    " Let's match the full line for now
    return '\V'
endfunction

function! SyntaxCheckers_twig_GetLocList()
    let makeprg = "twig-lint lint --format=csv ".shellescape(expand('%'))
    let errorformat = '"%f"\,%l\,%m'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat})
endfunction

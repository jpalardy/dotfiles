spacehi.vim
===========

This all started on [vim.org](http://www.vim.org/scripts/script.php?script_id=443). This plugin hadn't been touched in 10 years, it just worked.

Original quote:

    This plugin will highlight tabs and trailing spaces on a line, with the ability
    to toggle the highlighting on and off. Using highlighting to illuminate these
    characters is preferrable to using listchars and "set list" because it allows
    you to copy from the vim window without getting listchars shrapnel in your
    buffer.

    The highlighting is done on a per buffer basis, and can be toggled on and off
    easily (the default binds to F3 if it's unbound).

I added support for [non-breaking spaces (nbsp)](http://en.wikipedia.org/wiki/Nbsp) because I've been burned one too many times by a copy and paste.

I also changed the colors to, if I remember correctly, how spacehi used to look (very loud). The colors can be adjusted by setting the global variables:

    let g:spacehi_tabcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
    let g:spacehi_spacecolor="ctermfg=Black ctermbg=Yellow guifg=Blue guibg=Yellow"
    let g:spacehi_nbspcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"

Installation
------------

I recommend installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/jpalardy/spacehi.vim.git

If you like it the hard way, copy `plugin/spacehi.vim` from this repo into `~/.vim/plugin`.


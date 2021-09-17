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

Use your favorite package manager, or use Vim's built-in package support (since Vim 7.4.1528):

    mkdir -p ~/.vim/pack/plugins/start
    cd ~/.vim/pack/plugins/start
    git clone https://github.com/jpalardy/spacehi.vim.git

Disabling for specific filetypes
--------------------------------

When spacehi is enabled, it will highlight "weird spaces" in all files. That's not always useful...

For examples, [help files](https://github.com/jpalardy/spacehi.vim/issues/1) turn into Christmas trees, in the most unhelpful way.

To disable spacehi, only for some types of files, here's a snippet to adapt to your needs:

```vim
augroup mostly_spacehi
  autocmd!
  autocmd Syntax * SpaceHi
  autocmd FileType help     NoSpaceHi
  autocmd FileType diff     NoSpaceHi
  autocmd FileType man      NoSpaceHi
  autocmd FileType go       NoSpaceHi
  autocmd FileType make     NoSpaceHi
augroup END
```


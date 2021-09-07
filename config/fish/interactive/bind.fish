# esc-h
bind \eh 'commandline -r vim-; commandline -f execute'

# esc-`
bind \e` 'commandline -i "($history[1])"'

# esc-w
bind \ew 'commandline -r warp; commandline -f execute'

# ctrl-_ -- open rg results in vim
bind \c_ 'commandline -r "vim -q ($history[1] --vimgrep | psub)"; commandline -f execute'

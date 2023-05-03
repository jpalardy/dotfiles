# esc-h
bind \eh 'commandline -r "vim -c \"normal h\""; commandline -f execute'

# esc-`
bind \e` 'commandline -i "\$($history[1])"'

# esc-w
bind \ew fzf-warp

# ctrl-_ -- open rg results in vim
bind \c_ 'commandline -r "vim -q \$($history[1] --vimgrep | psub)"; commandline -f execute'

# esc-,
bind \e, fzf-contextual

# esc-r
bind \er fish-source


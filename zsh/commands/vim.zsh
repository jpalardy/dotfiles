
# start vim, execute ESC-h
vim-() {
  vim -c 'normal h'
}

vimgrep() {
  vim -q <(rg --vimgrep "$@")
}
alias vg=vimgrep


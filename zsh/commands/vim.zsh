
# start vim, execute ESC-h
vim-() {
  vim -c 'normal h'
}

vimgrep() {
  vim -c ":grep -i $*"
}


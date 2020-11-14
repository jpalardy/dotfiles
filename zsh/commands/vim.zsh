
# 1. start vim
# 2. execute ESC-h
vim-() {
  vim -s <(printf '\eh')
}

vimgrep() {
  vim -c ":grep -i $*"
}


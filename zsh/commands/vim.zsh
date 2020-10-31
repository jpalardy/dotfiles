
# 1. start vim
# 2. execute ESC-h
vim-() {
  vim -s <(printf '\eh')
}

# http://superuser.com/questions/210054/make-a-pipe-conditional-on-non-empty-return
pipe_if_not_empty () {
  input=$(cat);
  if [ "x$input" != x"" ]; then
    { printf '%s\n' "${input}"; } | "$@"
  fi
}

# start vim in PAGER mode
vim_picker() {
  pipe_if_not_empty \
    vim -c "setlocal noreadonly" \
        -c "setlocal cursorline" \
        -c "setlocal number" \
        -c "nnoremap <buffer> <CR> V:w! ~/.picked<CR>:qa!<CR>" \
        -c "vnoremap <buffer> <CR>  :w! ~/.picked<CR>:qa!<CR>" \
        -R -
}

# 1st parameter is command to generate a list
# 2nd parameter is command to run on selection
# 3rd (optional) parameter is DIRECT selection, bypassing VIM
pick_with_vim() {
  local TARGET=$HOME/.picked

  if [ -e "$TARGET" ]; then
    rm "$TARGET"
  fi

  if [ -n "$3" ]; then
    eval "$1" | sed -n $3p > "$TARGET"
  else
    eval "$1" | vim_picker
  fi

  if [ ! -e "$TARGET" ]; then
    return
  fi

  eval "$2" $(< "$TARGET")
}

vimgrep() {
  vim -c ":grep -i $*"
}


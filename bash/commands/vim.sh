
vimpager() {
  vim -R -
}

# 1. start vim
# 2. execute ESC-h
vim-() {
  vim -s <(printf '\eh')
}

# 1. start vim
# 2. execute ESC-r
vimr() {
  vim -s <(printf '\er')
}

# start vim in PAGER mode, with PickerMode plugin
vim_picker() {
  vim -c "PickerMode" -R -
}
export -f vim_picker

# 1st parameter is command to generate a list
# 2nd parameter is command to run on selection
# 3rd (optional) parameter is DIRECT selection, bypassing VIM
pick_with_vim() {
  if [ -e ~/.picked ]; then
    rm ~/.picked
  fi

  if [ -n "$3" ]; then
    eval "$1" | sed -n $3p > ~/.picked
  else
    eval "$1" | vim_picker
  fi

  if [ -e ~/.picked ]; then
    $2 "$(eval ${FILTER:-cat} ~/.picked)"
  fi
}
export -f pick_with_vim


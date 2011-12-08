
vimpager() {
  vim -R -
}

# 1. start vim
# 2. execute ESC-h
vim-() {
  vim -s <(printf '\eh')
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

  local old_IFS="$IFS"
  IFS=$'\n'
  local lines=($(eval ${FILTER:-cat} "$TARGET"))
  IFS="$old_IFS"

  # neat! add this line to the bash history
  # as if we had typed it
  history -s $2 "${lines[@]}"
  $2 "${lines[@]}"
}
export -f pick_with_vim


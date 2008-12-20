
function vim-() {
  vim -c "ScratchFind" -c "on"
}

# start vim in PAGER mode, with PickerMode plugin
function vim_picker() {
  vim -c "PickerMode" -
}

# 1st parameter is command to generate a list
# 2nd parameter is command to run on selection
# 3rd (optional) parameter is DIRECT selection, bypassing VIM
function pick_with_vim() {
  if [ -n "$3" ]; then
    eval "$1" | sed -n $3p > ~/.picked
  else
    eval "$1" | vim_picker
  fi

  if [ -e ~/.picked ]; then
    $2 "`cat ~/.picked`"
  fi
}


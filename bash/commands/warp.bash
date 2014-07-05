#!/bin/bash

warp() {
  # ensure SOURCE file exists
  local SOURCE="$HOME/.warp"
  if [ ! -f "$SOURCE" ]; then
    echo "$SOURCE does not exist..."
    return 1
  fi

  # cleanup TARGET file
  local TARGET=$HOME/.picked
  if [ -e "$TARGET" ]; then
    rm "$TARGET"
  fi

  # make a selection, with vim
  cat "$SOURCE" | vim -c "setlocal noreadonly" \
                      -c "setlocal cursorline" \
                      -c "setlocal number" \
                      -c "nnoremap <buffer> <CR> V:w! ~/.picked<CR>:qa!<CR>" \
                      -c "vnoremap <buffer> <CR>  :w! ~/.picked<CR>:qa!<CR>" \
                      -R -
  # nothing was selected, abort
  if [ ! -e "$TARGET" ]; then
    return
  fi

  # transform seletion in ssh command
  local SSH=${SSH:-ssh}
  if [ $(cat "$TARGET" | wc -l) -gt 1 ]; then
    SSH=${MULTISSH:-csshX}
  fi
  local COMMAND=$(awk -v cmd=$SSH 'BEGIN {printf cmd} {printf " " $1} END { print "" }' "$TARGET")

  # add the command to the bash history as if we had typed it, will only work if sourced
  history -s $COMMAND
  # run the command
  $COMMAND
}

# allow warp to be sourced without running
if [[ $_ == $0 ]]; then
  warp
fi


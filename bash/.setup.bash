#!/bin/bash

DOTFILES=$(realpath "$PWD/..")
first=1

relink() {
  if [ "$(readlink "$BASE_DIR/$1")" = "$2" ]; then
    return
  fi
  if [[ $first = 1 ]]; then
    echo "set -e"
    first=0
  fi
  if [[ -e "$BASE_DIR/$1" || -L "$BASE_DIR/$1" ]]; then
    echo "rm -f $BASE_DIR/$1"
  fi
  echo "ln -s -v $2 $BASE_DIR/$1"
}

BASE_DIR="$HOME"

relink .bashrc       "$DOTFILES/bash/bashrc"
relink .bash_profile "$DOTFILES/bash/bash_profile"
relink .bash_logout  "$DOTFILES/bash/bash_logout"


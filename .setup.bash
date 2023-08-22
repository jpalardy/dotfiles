#!/bin/bash

DOTFILES=$(pwd)
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

relink .inputrc      "$DOTFILES/inputrc"

relink .vim          "$DOTFILES/vim"

relink .gitconfig    "$DOTFILES/git/gitconfig"
relink .gitignore    "$DOTFILES/git/gitignore"

relink .tmux.conf    "$DOTFILES/tmux.conf"

if [ "$(uname)" == "Linux" ]; then
  relink .Xmodmap "$DOTFILES/x/Xmodmap"
fi

# lang
relink .npmrc        "$DOTFILES/lang/js/npmrc"
relink .Rprofile     "$DOTFILES/lang/r/Rprofile"

# misc
relink .psqlrc       "$DOTFILES/psqlrc"
relink .sqliterc     "$DOTFILES/sqliterc"
relink .hammerspoon  "$DOTFILES/hammerspoon"

# -------------------------------------------------

BASE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

relink fish     "$DOTFILES/config/fish"
relink yamllint "$DOTFILES/config/yamllint"


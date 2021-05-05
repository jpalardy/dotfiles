#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

first=1

relink() {
  if [ "$(readlink "$XDG_CONFIG_HOME/$1")" = "$2" ]; then
    return
  fi
  if [[ $first = 1 ]]; then
    echo "set -e"
    first=0
  fi
  if [[ -e "$XDG_CONFIG_HOME/$1" || -L "$XDG_CONFIG_HOME/$1" ]]; then
    echo "rm -f $XDG_CONFIG_HOME/$1"
  fi
  echo "ln -s -v $2 $XDG_CONFIG_HOME/$1"
}

DOTFILES=$(pwd)

relink fish "$DOTFILES/config/fish"


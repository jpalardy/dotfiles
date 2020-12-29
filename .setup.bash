#!/bin/bash

relink() {
  if [ "$(readlink "$HOME/$1")" = "$2" ]; then
    return
  fi
  echo "rm -f $HOME/$1"
  echo "ln -s -v $2 $HOME/$1"
}

DOTFILES=$(pwd)

echo "set -e"

relink .bashrc       "$DOTFILES/bash/bashrc"
relink .bash_profile "$DOTFILES/bash/bash_profile"
relink .bash_logout  "$DOTFILES/bash/bash_logout"
relink .inputrc      "$DOTFILES/bash/inputrc"

relink .zshrc        "$DOTFILES/zsh/zshrc"
relink .zlogout      "$DOTFILES/zsh/zlogout"

relink .vim          "$DOTFILES/vim"

relink .gitconfig    "$DOTFILES/git/gitconfig"
relink .gitignore    "$DOTFILES/git/gitignore"

relink .screenrc     "$DOTFILES/screenrc"
relink .tmux.conf    "$DOTFILES/tmux.conf"

# lang
relink .irbrc        "$DOTFILES/lang/ruby/irbrc"
relink .gemrc        "$DOTFILES/lang/ruby/gemrc"
relink .npmrc        "$DOTFILES/lang/js/npmrc"
relink .prettierrc   "$DOTFILES/lang/js/prettierrc"
relink .Rprofile     "$DOTFILES/lang/r/Rprofile"

relink .sqliterc     "$DOTFILES/sqliterc"

relink .slate        "$DOTFILES/slate"


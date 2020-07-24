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

relink .bash         "$DOTFILES/bash"
relink .bashrc       "$DOTFILES/bash/bashrc"
relink .bash_profile "$DOTFILES/bash/bash_profile"
relink .bash_logout  "$DOTFILES/bash/bash_logout"
relink .inputrc      "$DOTFILES/bash/inputrc"

relink .zshrc        "$DOTFILES/zsh/zshrc"

relink .vim          "$DOTFILES/vim"
relink .vimrc        "$DOTFILES/vim/vimrc"

relink .gitconfig    "$DOTFILES/git/gitconfig"
relink .gitignore    "$DOTFILES/git/gitignore"

relink .screenrc     "$DOTFILES/screenrc"
relink .tmux.conf    "$DOTFILES/tmux.conf"

relink .irbrc        "$DOTFILES/ruby/irbrc"
relink .gemrc        "$DOTFILES/ruby/gemrc"

relink .npmrc        "$DOTFILES/js/npmrc"
relink .eslintrc     "$DOTFILES/js/eslintrc"
relink .prettierrc   "$DOTFILES/js/prettierrc"

relink .Rprofile     "$DOTFILES/r/Rprofile"

relink .sqliterc     "$DOTFILES/sqliterc"

relink .slate        "$DOTFILES/slate"


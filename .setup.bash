#!/bin/bash

flag="$@"

function relink() {
  ln -s -v $flag $2 $1
}

DOTFILES=$(pwd)

cd

relink .inputrc      $DOTFILES/inputrc
relink .bash         $DOTFILES/bash
relink .bashrc       $DOTFILES/bashrc
relink .bash_profile $DOTFILES/bash_profile
relink .bash_logout  $DOTFILES/bash_logout

relink .vim          $DOTFILES/vim
relink .vimrc        $DOTFILES/vimrc

relink .gitconfig    $DOTFILES/gitconfig
relink .gitignore    $DOTFILES/gitignore

relink .screenrc     $DOTFILES/screenrc
relink .tmux.conf    $DOTFILES/tmux.conf

relink .irbrc        $DOTFILES/ruby/irbrc
relink .gemrc        $DOTFILES/ruby/gemrc

relink .npmrc        $DOTFILES/npmrc
relink .eslintrc     $DOTFILES/eslintrc

relink .Rprofile     $DOTFILES/r/Rprofile

relink .sqliterc     $DOTFILES/sqliterc

relink .slate        $DOTFILES/slate

relink .filter       $DOTFILES/filter


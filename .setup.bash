#!/bin/bash

flag="$@"

function relink() {
  ln -s -h -v $flag $2 $1
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

relink .irbrc        $DOTFILES/irbrc
relink .rdebugrc     $DOTFILES/rdebugrc
relink .rvmrc        $DOTFILES/rvmrc

relink .npmrc        $DOTFILES/npmrc
relink .jshintrc     $DOTFILES/jshintrc

relink .filter       $DOTFILES/filter


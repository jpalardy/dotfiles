#!/bin/bash

function relink() {
  rm -i $1
  ln -sn $2 $1
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

relink .irbrc        $DOTFILES/irbrc
relink .rdebugrc     $DOTFILES/rdebugrc

relink .screenrc     $DOTFILES/screenrc

relink .ssh/config   $DOTFILES/ssh/config

relink .gitconfig    $DOTFILES/gitconfig

relink .rtorrent.rc  $DOTFILES/rtorrent.rc


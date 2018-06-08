
# prepend_colon(val, var)
prepend_colon() {
  if [ -z "$2" ]; then
    echo "$1"
  else
    echo "$1:$2"
  fi
}

# prepend_PATHs(path)
prepend_PATHs() {
  if [ -d "$1/sbin" ]; then
    PATH=$(prepend_colon "$1/sbin" "$PATH")
  fi
  if [ -d "$1/bin" ]; then
    PATH=$(prepend_colon "$1/bin" "$PATH")
  fi
  if [ -d "$1/share/man" ]; then
    MANPATH=$(prepend_colon "$1/share/man" "$MANPATH")
  fi
}

# TABULA RASA
umask 22
ulimit -c 0

export DOTFILES="$HOME/dotfiles"

PATH=""
MANPATH=""

prepend_PATHs "/usr/X11"
prepend_PATHs ""
prepend_PATHs "/usr"
prepend_PATHs "/usr/local"
prepend_PATHs "/opt/local"
prepend_PATHs "$HOME/local"
prepend_PATHs "$DOTFILES"

# very specific
prepend_PATHs "$HOME/Documents/wiki/.local"

#-------------------------------------------------

export PATH
export MANPATH

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-9"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export RLWRAP_HOME="$HOME/.rlwrap"

#-------------------------------------------------

unset prepend_colon
unset prepend_PATHs


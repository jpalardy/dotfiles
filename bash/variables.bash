
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
    if [ -n "$2" ]; then
      echo "PATH += $1/sbin" | sed -e "s_${HOME}_~_"
    fi
    PATH=$(prepend_colon "$1/sbin" "$PATH")
  fi
  if [ -d "$1/bin" ]; then
    if [ -n "$2" ]; then
      echo "PATH += $1/bin" | sed -e "s_${HOME}_~_"
    fi
    PATH=$(prepend_colon "$1/bin" "$PATH")
  fi
  if [ -d "$1/share/man" ]; then
    if [ -n "$2" ]; then
      echo "MANPATH += $1/share/man" | sed -e "s_${HOME}_~_"
    fi
    MANPATH=$(prepend_colon "$1/share/man" "$MANPATH")
  fi
}

# TABULA RASA
umask 22
ulimit -c 0

export DOTFILES="$HOME/dotfiles"

PATH=""
MANPATH=""

# obvious
prepend_PATHs "/usr/X11"
prepend_PATHs ""
prepend_PATHs "/usr"
prepend_PATHs "/usr/local"

# very specific
prepend_PATHs "$DOTFILES"

PATH() {
  echo "$PATH" | sed -e 's/:/ /g' | xargs -n1 echo
}

#-------------------------------------------------

export PATH
export MANPATH

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-5"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export RLWRAP_HOME="$HOME/.rlwrap"


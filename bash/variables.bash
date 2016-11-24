
export DOTFILES=$HOME/dotfiles

umask 22
ulimit -c 0

paths() {
  env | grep PATH
}

# prepend_colon(val, var)
prepend_colon() {
  if [ -z "$2" ]; then
    echo $1
  else
    echo $1:$2
  fi
}

# unshift_path(path)
unshift_path() {
  if [ -d $1/sbin ]; then
    export PATH=$(prepend_colon "$1/sbin" $PATH)
  fi
  if [ -d $1/bin ]; then
    export PATH=$(prepend_colon "$1/bin" $PATH)
  fi

  if [ -d $1/share/man ]; then
    export MANPATH=$(prepend_colon "$1/share/man" $MANPATH)
  fi
}

# TABULA RASA
export PATH=""
export MANPATH=""

unshift_path "/usr/X11"
unshift_path ""
unshift_path "/usr"
unshift_path "/usr/local"
unshift_path "/opt/local"
unshift_path "$HOME/local"
unshift_path "$DOTFILES"

export PATH=$(prepend_colon ".local/bin" $PATH)

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-9"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ACK_COLOR_FILENAME="cyan"
export ACK_COLOR_MATCH="bold red"

export RLWRAP_HOME=$HOME/.rlwrap


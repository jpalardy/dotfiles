
if [ "`uname`" == "Darwin" ]; then

  ls() {
    gls "$@"
  }

  find() {
    gfind "$@"
  }

  du() {
    gdu "$@"
  }

  sed() {
    gsed "$@"
  }

  netstat_tcp() {
    netstat -n -f inet -p tcp
  }

  _lock() {
    /System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend
  }

fi


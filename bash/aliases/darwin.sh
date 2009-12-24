
if [ "`uname`" == "Darwin" ]; then

  function ls() {
    gls "$@"
  }

  function find() {
    gfind "$@"
  }

  function du() {
    gdu "$@"
  }

  function sed() {
    gsed "$@"
  }

  function netstat_tcp() {
    netstat -n -f inet -p tcp
  }

  function _lock() {
    /System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend
  }

fi


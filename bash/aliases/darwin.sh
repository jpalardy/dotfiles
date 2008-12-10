
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

fi


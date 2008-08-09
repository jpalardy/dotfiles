
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

fi


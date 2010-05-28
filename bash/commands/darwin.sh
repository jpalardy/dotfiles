
if [ "$(uname)" == "Darwin" ]; then

  function ls {
    gls "$@"
  }

  function tac {
    gtac "$@"
  }
  export -f tac

  alias find="gfind"
  alias du="gdu"
  alias sed="gsed"

  _lock() {
    /System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend
  }

fi



if [ "$(uname)" == "Darwin" ]; then

  function ls {
    gls "$@"
  }

  alias find="gfind"
  alias du="gdu"
  alias sed="gsed"

  _lock() {
    /System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend
  }

fi


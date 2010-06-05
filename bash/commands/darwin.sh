
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
fi



function _blank() {
  cat "$@" | \grep .
}

function _tidy() {
  cat "$@" | tidy -q -indent --indent-spaces 2 -wrap 0 -clean --tidy-mark no --show-warnings no
}

function _thousands() {
  cat "$@" | awk '{printf("%15s", $1); $1=""; print $0}' | sed -r 's/^(...)(...)(...)(...)(...)/\1,\2,\3,\4,\5/' | sed 's/ ,/  /g'
}


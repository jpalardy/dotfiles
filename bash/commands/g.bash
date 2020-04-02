
g() {
  local dst
  dst=$(awk -v "key=$1" -F' += +' '
    { LUT[$1] = $2 }
    END {
      print LUT[key]
    }
  ' "$HOME/.lists/g")
  if [ -z "$dst" ]; then
    cat "$HOME/.lists/g"
    return
  fi
  dst="${dst/#\~/$HOME}"
  cd "$dst"
}

_complete_g() {
  local word=${COMP_WORDS[COMP_CWORD]}
  local keys=$(awk -F' += +' '{ print $1 }' "$HOME/.lists/g")
  COMPREPLY=( $(compgen -W "${keys}" -- "$word") )
}
complete -F _complete_g g

g.add() {
  local key=${1:-$(basename "$PWD")}
  local value=${2:-$PWD}
  if [ $# -lt 2 ]; then
    echo 2>&1 "$key = $value"
  fi
  echo "$key = $value" >> "$HOME/.lists/g"
}

g.edit() {
  "$EDITOR" "$HOME/.lists/g"
}


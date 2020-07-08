
g() {
  local config="$HOME/.lists/g"
  if [ "$1" = "-e" ]; then
    $EDITOR $config
    return
  fi
  if [ "$1" = "-a" ]; then
    shift
    local key=${1:-${PWD:t}}
    local value=${2:-$PWD}
    value=${value#$HOME/}
    if [ $# -lt 2 ]; then
      echo 2>&1 "$key = $value"
    fi
    echo "$key = $value" >> $config
    return
  fi
  #...
  local dst
  dst=$(awk -v "key=$1" -F' += +' '
    { LUT[$1] = $2 }
    END {
      if (!(key in LUT)) {
        exit
      }
      if (LUT[key] !~ /^\//) {
        printf("%s/", ENVIRON["HOME"])
      }
      print LUT[key]
    }
  ' $config)
  if [ -z "$dst" ]; then
    cat $config
    return
  fi
  cd "$dst"
}

_complete_g() {
  compadd $(awk -F' += +' '{ print $1 }' "$HOME/.lists/g")
}
compdef _complete_g g


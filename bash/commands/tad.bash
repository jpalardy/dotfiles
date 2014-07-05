
tad() {
  local ts=$(date +%s)
  local d="$HOME/.throw-away/$ts"
  mkdir -p $d
  (cd $d; bash)
  rm -r $d
}

ddt() {
  local name="$(date +%F)_$(echo "$@" | sed -e "s/ /_/g")"
  mkdir $name && cd $name
}


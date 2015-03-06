
# throw-away directory
tad() {
  local ts=$(date +%s)
  local d="$HOME/.throw-away/$ts"
  mkdir -p $d
  (cd $d; bash)
  rm -rf $d
}

# date name directory
dnd() {
  local name="$(date +%F)_$(echo "$@" | sed -e "s/ /_/g")"
  mkdir $name && cd $name
}


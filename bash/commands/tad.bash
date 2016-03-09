
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
  local name="$(date +%F)-$(echo "$@" | sed -e "s/ /-/g")"
  mkdir $name && cd $name
}


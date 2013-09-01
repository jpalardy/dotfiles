
tad() {
  local ts=$(date +%s)
  local d="$HOME/.throw_away/$ts"
  mkdir -p $d
  (cd $d; bash)
  rm -r $d
}


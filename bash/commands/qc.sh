
qc() {
  local SOURCE="$HOME/.qc"
  if [ ! -f "$SOURCE" ]; then
    echo "$SOURCE does not exist..."
    return 1
  fi

  pick_with_vim "cat $SOURCE" "eval" $1
}


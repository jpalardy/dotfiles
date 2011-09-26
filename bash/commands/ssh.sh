
warp() {
  local SOURCE="$HOME/.warp"
  if [ ! -f "$SOURCE" ]; then
    echo "$SOURCE does not exist..."
    return 1
  fi

  FILTER="awk '{print \$1}'" pick_with_vim "cat $SOURCE" "ssh" $1
}


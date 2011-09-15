
# pick a URL from $HOME/.web and open
web() {
  if [ ! -f $HOME/.web ]; then
    echo "$HOME/.web does not exist..."
    return 1
  fi

  FILTER="awk '{print \$1}'" pick_with_vim "cat $HOME/.web" "open" $1
}


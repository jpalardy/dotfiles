
chunks() {
  if [ -z "$1" ]; then
    echo >&2 "missing extension"
    return 1
  fi
  $EDITOR "$DOTFILES/chunks/chunks.$1"
}

_complete_chunks() {
  compadd $(ls "$DOTFILES/chunks/" | awk -F. '{print $NF}')
}
compdef _complete_chunks chunks



chunks() {
  if [ -z "$1" ]; then
    echo >&2 "missing extension"
    return 1
  fi
  $EDITOR "$DOTFILES/chunks/chunks.$1"
}

_complete_chunks() {
  local word=${COMP_WORDS[COMP_CWORD]}
  local keys=$(ls "$DOTFILES/chunks/" | awk -F. '{print $NF}')
  COMPREPLY=( $(compgen -W "${keys}" -- "$word") )
}
complete -F _complete_chunks chunks


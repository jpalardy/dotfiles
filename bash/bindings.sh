
if [ -t 0 ]; then
  bind '"\e[A"':history-search-backward
  bind '"\e[B"':history-search-forward

  # the dreaded backspace
  bind '"\C-?": backward-delete-char'
  stty erase ^?
fi


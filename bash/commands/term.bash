
term_colors() {
  local fg bg

  for fg in 0 1 2 3 4 5 6 7; do
    for bg in 0 1 2 3 4 5 6 7; do
      fg_bg $fg $bg
    done
    echo
  done
}

fg_bg() {
  local fg=$1
  local bg=${2:-0}
  printf "%3d,%3d  " $fg $bg
  echo "$(tput setaf $fg)$(tput setab $bg) The quick brown fox jumps over the lazy dog $(tput sgr0)"
}

fg_bg_random() {
  fg_bg $(shuf -n 1 -i 0-255) $(shuf -n 1 -i 0-255)
}


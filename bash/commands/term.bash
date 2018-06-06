
fg_bg() {
  local fg=$1
  local bg=${2:-0}
  printf "%3d,%3d  " $fg $bg
  echo "$(tput setaf $fg)$(tput setab $bg) The quick brown fox jumps over the lazy dog $(tput sgr0)"
}

fg_bg_random() {
  fg_bg $(shuf -n 1 -i 0-255) $(shuf -n 1 -i 0-255)
}


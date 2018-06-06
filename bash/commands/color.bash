
# this function only exists for the duration of this file -- check unset below
GENERATE_echo_color() {
  local color_name=$1
  local color_num=$2
  local color_escape
  color_escape=$(tput setaf "$color_num")
  local color_reset
  color_reset=$(tput sgr0)
  eval "
    echo-${color_name}() {
      echo \$ECHO_FLAGS \"${color_escape}\$*${color_reset}\"
    }
  "
}

GENERATE_echo_color black 0
GENERATE_echo_color red 1
GENERATE_echo_color green 2
GENERATE_echo_color yellow 3
GENERATE_echo_color blue 4
GENERATE_echo_color magenta 5
GENERATE_echo_color cyan 6
GENERATE_echo_color white 7

unset GENERATE_echo_color


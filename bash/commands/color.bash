
generate_echo_color() {
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

generate_echo_color black 0
generate_echo_color red 1
generate_echo_color green 2
generate_echo_color yellow 3
generate_echo_color blue 4
generate_echo_color magenta 5
generate_echo_color cyan 6
generate_echo_color white 7

#-------------------------------------------------

unset generate_echo_color


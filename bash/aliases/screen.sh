
alias sls='screen -ls'

function screen_r_x() {
  screen -r $1 || screen -x $1
}

function sc() {
  pick_with_vim "screen -ls | awk '/^	/ {print \$1}'" "screen_r_x"
}

function screen_rotate() {
  local session_name=${1:?"missing session name"}
  local sleep_duration=${2:-5}

  while true; do
    screen -S $session_name -X next
    sleep $sleep_duration
  done
}


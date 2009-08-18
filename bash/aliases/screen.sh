
alias sls='screen -ls'

function screen_r_x() {
  screen -r $1 || screen -x $1
}

function sc() {
  pick_with_vim "screen -ls | awk '/^	/ {print \$1}'" "screen_r_x"
}


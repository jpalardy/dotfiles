
alias sls='screen -ls'

screen_r_x() {
  screen -r $1 || screen -x $1
}

sc() {
  pick_with_vim "screen -ls | awk '/^	/ {print \$1}'" "screen_r_x"
}


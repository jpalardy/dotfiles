
# 2019-01-24
implode() {
  local target="$PWD"
  local code
  code=$(seq 0 9 | shuf -r -n 4 | awk '{printf "%s", $0}')
  echo -n "$code: delete $target ? "
  read input
  if [ "$input" != "$code" ]; then
    return
  fi
  cd ..
  rm -rf "$target"
}

# 2020-08-29
alias -g _V='| vim -R -'
alias -g _G='| rg'

# 2020-09-27
# pick parent with fzf
bu() {
  cd $(
    local p=$PWD
    while [ $p != "/" ]; do
      echo $p
      p=${p:h}
    done | fzf
  )
}

# 2020-09-29
alias fzf="fzf --reverse --info=hidden --height=20"


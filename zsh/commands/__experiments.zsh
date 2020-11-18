
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

# 2020-10-28
tmr() {
  if [ $# -eq 0 ]; then
    tmux
    return
  fi
  tmux new-session "$*; exec $SHELL"
}

# 2020-10-30
alias tm=tmux

# 2020-11-02
alias tmrw='tmux rename-window $PWD:t'

# 2020-11-12
alias rsy="rsync -av --progress"

# 2020-11-18
git-switch-master-to-main() {
  cat <<END
1. git branch -m master main
2. git push -u origin main
3. git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
4. remote:
   a) github: switch default branch
   b) bare repo: git symbolic-ref HEAD refs/heads/main
5. git push origin --delete master
END
}


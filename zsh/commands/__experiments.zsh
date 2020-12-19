
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

# 2020-12-19
alias tls="tmux ls"

# 2020-11-12
alias rsy="rsync -av --progress"

# 2020-11-18
git-switch-master-to-main() {
  echo '
FIRST TIME
1. git branch -m master main
2. git push -u origin main
3. git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
4. remote:
   a) github: switch default branch
   b) bare repo: git symbolic-ref HEAD refs/heads/main
5. git push origin --delete master

OTHER CLONES
1. git branch -m master main
2. git branch -u origin/main
'
}


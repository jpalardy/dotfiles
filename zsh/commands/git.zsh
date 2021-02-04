
alias git_vimdiff="git difftool"

gcp() {
  # check for 'ok' file
  if [ ! -f .gcp_ok ]; then
    echo >&2 "no .gcp_ok"
    return
  fi
  git commit -av -m '-' && git push
}

git_diff() {
  git diff "$@" |& vim -R -
}

alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(auto)%d%Creset %C(dim white)%an%Creset' \$(git_heads_)"

git_heads_() {
  local names="HEAD"
  if git rev-parse @{upstream} &>/dev/null; then
    names+=" @{upstream}"
  fi
  echo $names
}

# inspired by https://preslav.me/2020/03/01/use-the-git-history/
git-cc() {
  git log --name-only --format=format: "$@" | grep . | __count
}
compdef _git git-cc=git_log

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


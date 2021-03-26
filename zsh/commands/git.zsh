
alias git_vimdiff="git difftool"

gcp() {
  if [ "$(git config alias.gcp.enabled 2>/dev/null)" != "true" ]; then
    echo >&2 "gcp is disabled for this repository -- fix: git config alias.gcp.enabled true"
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


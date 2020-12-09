
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
  git diff -w "$@" | vim -R -
}

alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(auto)%d%Creset %C(dim white)%an%Creset' --all"

# inspired by https://preslav.me/2020/03/01/use-the-git-history/
git-changes-count() {
  git log --name-only --format=format: "$@" | grep . | __count
}



alias git_vimdiff="git difftool"

gcp() {
  # check for 'ok' file
  if [ -f .gcp_ok ]; then
    git commit -av -m '-' && git push
  else
    echo "no .gcp_ok"
  fi
}

git_diff() {
  git diff -w "$@" | vim -R -
}

dot_wait() {
  local i=0
  for i in $(seq 1 ${1:-5}); do
    read -t 1 -p '.'
    if [ $? -eq 0 ]; then
      return
    fi
  done
  echo
}

git_review() {
  local commits=$(git log --format="%H" "$@" | tac)
  git log --oneline "$@"
  dot_wait 3
  for commit in $commits; do
    git show $commit | vim -R -
  done
}

#-------------------------------------------------

alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(yellow)%d%Creset %C(dim white)%an%Creset' --abbrev-commit --date=relative --date-order --all"

#-------------------------------------------------

git_out() {
  git log --branches --not --remotes
}

git_out_decorate() {
  git log --branches --not --remotes --simplify-by-decoration --decorate --oneline
}



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

#-------------------------------------------------

alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(auto)%d%Creset %C(dim white)%an%Creset'"
alias glga="glg --all"
alias glgd="glg --date-order"
alias glgda="glgd --all"


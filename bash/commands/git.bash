
alias git_vimdiff="git difftool"

git_diff() {
  git diff -w "$@" | vim -R -
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

gll() {
  git log $1 master@{1}..
}

gllp() {
  gll -p
}


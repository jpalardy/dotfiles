
git_vimdiff() {
  GIT_PAGER= GIT_EXTERNAL_DIFF=git_diff_wrapper git diff -w "$@"
}
complete -F _git_diff -o default git_vimdiff

git_diff() {
  git diff -w "$@" | vim -R -
}
complete -F _git_diff -o default git_diff

#-------------------------------------------------

glg() {
  git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(yellow)%d%Creset' --abbrev-commit --date=relative
}

gln() {
  git log --name-only "$@"
}
complete -F _git_log -o default gln

#-------------------------------------------------

git_mod() {
  git ls-files -m
}

#-------------------------------------------------

git_track() {
  git checkout --track -b ${1##*/} $1
}
complete -F _git_branch -o default git_track

git_attach() {
  git remote add origin $1
  git push origin master
  git config --add branch.master.remote origin
  git config --add branch.master.merge  refs/heads/master
}


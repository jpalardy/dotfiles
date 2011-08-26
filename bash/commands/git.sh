
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
  git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(yellow)%d%Creset' --abbrev-commit --date=relative "$@"
}
complete -F _git_log -o default glg

gln() {
  git log --name-only "$@"
}
complete -F _git_log -o default gln

#-------------------------------------------------

git_mod() {
  git ls-files -m
}

#-------------------------------------------------

git_attach() {
  git remote add origin $1
  git push origin master
  git branch --set-upstream master origin/master
}


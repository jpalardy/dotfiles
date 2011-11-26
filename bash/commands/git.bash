
git_vimdiff() {
  git difftool
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

#-------------------------------------------------

git_status_vim() {
  FILTER="awk '{print \$2}'" pick_with_vim "git status --short" "vim"
}



git_diff() {
  git diff --no-ext-diff -w --no-prefix "$@" | vim -R -
}
complete -F _git_diff -o default git_diff

git_diff_head() {
  git_diff HEAD
}

git_diff_cached() {
  git_diff --cached
}

git_mod() {
  git ls-files -m
}

gcp() {
  git commit -av -m '-' && git push
}

glg() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
}

glp() {
  git log -p --no-prefix "$@"
}
complete -F _git_log -o default glp

gln() {
  git log --name-only "$@"
}
complete -F _git_log -o default gln

gb() {
  git branch "$@"
}
complete -F _git_branch -o default gb

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


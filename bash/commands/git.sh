
git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
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
  git log -p "$@"
}
complete -F _git_log -o default glp

gln() {
  git log --name-only "$@"
}
complete -F _git_log -o default gln

gba() {
  git branch -a "$@"
}
complete -F _git_branch -o default gba

gs() {
  git status "$@"
}



git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

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
  git log -p --since="2 weeks ago" "$@"
}

gln() {
  git log --name-only "$@"
}

gba() {
  git branch -a "$@"
}

gs() {
  git status "$@"
}


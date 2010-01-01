
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

function git_diff_head() {
  git_diff HEAD
}

function git_diff_cached() {
  git_diff --cached
}

function git_mod() {
  git ls-files -m
}

function gcp() {
  git commit -av -m '-' && git push
}

function glg() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
}

function glp() {
  git log -p "$@"
}

function gln() {
  git log --name-only "$@"
}


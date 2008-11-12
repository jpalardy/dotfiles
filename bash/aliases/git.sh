
function git_diff() {
  git diff "$@" | vim -R -
}



function git_diff() {
  git diff -w "$@" | vim -R -
}

function git_diff_head() {
  git_diff HEAD
}

function git_diff_cached() {
  git_diff --cached
}

function git_in() {
  git fetch; git log master..FETCH_HEAD
}

function git_out() {
  git fetch; git log FETCH_HEAD..master
}



function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
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

function git_m_vim() {
  vim -c 'ScratchFind "git ls-files -m"' -c "on"
}


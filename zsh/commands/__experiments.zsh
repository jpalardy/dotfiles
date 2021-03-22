
# 2021-03-01
git-sd() {
  git status --short "$@" | awk -F/ '{print $1}' | __count
}


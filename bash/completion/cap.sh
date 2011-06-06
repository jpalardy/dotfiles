
_check_capfile() {
  cache_complete Capfile .cache_cap "cap -T | awk '/^cap / {print \$2}'"
}
complete -F _check_capfile -o default cap


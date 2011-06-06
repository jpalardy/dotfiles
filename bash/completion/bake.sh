
_check_bakefile() {
  cache_complete Bakefile .cache_bake "bake | awk '/^bake / {print \$2}'"
}
complete -F _check_bakefile -o default bake



_check_makefile() {
  cache_complete Makefile .cache_make "echo"
}
complete -F _check_makefile -o default make


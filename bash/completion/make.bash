
_check_makefile() {
  cache_complete Makefile .cache_make "make -rpn | sed -n -e '/^$/ { n ; /^[^ ]*:/p }' | sed -e 's/://g'"
}
complete -F _check_makefile -o default make


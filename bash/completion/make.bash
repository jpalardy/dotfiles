
_check_makefile() {
  cache_complete Makefile .cache_make "make -rpn | sed -n -e '/^$/ { n ; /^[^ ]*:/p }' | awk -F: '{ print \$1 }'"
}
complete -F _check_makefile -o default make


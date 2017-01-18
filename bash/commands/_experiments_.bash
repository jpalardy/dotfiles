
find_date_sort() {
  find "$@" -type f -printf "%T+ %p\n" | sed -e 's/.0000000000 / /' -e 's/+/ /' | sort
}
alias fds=find_date_sort

holidays() {
  gcal -q ${1:-CA_QU} -n
}

which-edit() {
  vim $(which "$@")
}


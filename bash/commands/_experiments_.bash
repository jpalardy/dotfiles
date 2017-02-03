
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

# ldf -- last downloaded file
ldf() {
  local file=~/Downloads/$(ls -1t ~/Downloads/ | head -n1)
  read -p "confirm: $file "
  mv "$file" .
}

# scratch file
scr() {
  local ext="$1"
  touch "scratch.${ext}"
  vim "scratch.${ext}"
}


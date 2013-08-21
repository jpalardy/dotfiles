
jekyll_serve() {
  jekyll serve --watch --drafts "$@"
}

jekyll_publish() {
  local file=$1
  mv -iv $file _posts/$(date +%F)-$(basename $file)
}


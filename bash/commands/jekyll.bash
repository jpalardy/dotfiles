
jekyll_serve() {
  docker run --rm -v "$PWD:/src" -p 4000:4000 grahamc/jekyll serve -H 0.0.0.0 --watch --draft --force_polling
}

jekyll_publish() {
  local file=$1
  mv -iv $file _posts/$(date +%F)-$(basename $file)
}


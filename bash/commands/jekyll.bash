
jekyll-build() {
  echo "# browser-sync --watch"
  docker run --rm -v "$PWD:/src" -p 4000:4000 grahamc/jekyll build --watch --drafts "$@"
}

jekyll-publish() {
  local file=$1
  mv -iv "$file" "_posts/$(date +%F)-$(basename "$file")"
}



check_expiration() {
  echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -dates
}

npm2svg() {
  npm ls --json "$@" | npx npm2dot | grep -v "undefined" | twopi -Tsvg -o out.svg -Goverlap=false
  open -a "Google Chrome" out.svg
}

function title {
  echo -ne "\033]0;"$*"\007"
}



check-ssl-cert() {
  local cert_end_date
  local days_valid
  for domain in "$@"; do
    cert_end_date=$(curl --insecure -v "https://$domain" 2>&1 | awk -F"date: " '/expire date:/ {print $2}')
    days_valid=$(( ($(date -d "${cert_end_date}" +%s) - $(date +%s)) / 86400 ))
    echo -n "$domain: "
    if [ "$days_valid" -ge 30 ]; then
      echo-green "$days_valid days"
    else
      echo-red "$days_valid days"
    fi
  done
}

npm2svg() {
  npm ls --json "$@" | npx npm2dot | grep -v "undefined" | twopi -Tsvg -o out.svg -Goverlap=false
  open -a "Google Chrome" out.svg
}

function title {
  echo -ne "\033]0;"$*"\007"
}


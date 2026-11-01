function ltrim(s) {
  sub(/^[[:space:]]+/, "", s)
  return s
}

function rtrim(s) {
  sub(/[[:space:]]+$/, "", s)
  return s
}

function trim(s) {
  return rtrim(ltrim(s))
}

function squish(s) {
  gsub(/[[:space:]]+/, " ", s)
  return trim(s)
}

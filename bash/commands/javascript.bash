
npm_list() {
  npm list --json | jq '.dependencies | to_entries[] | "\(.key) \(.value.version)"' -r | column -t
}



npm_list() {
  npm list --json "$@" | jq '.dependencies | keys'
}



lintify() {
  local lang="$1"
  case "$lang" in
    go)
      cp "$DOTFILES/go/golangci.yml" .golangci.yml
      ;;
    js)
      cp "$DOTFILES/js/eslintrc" .eslintrc
      npm install --save-dev eslint eslint-config-airbnb-base eslint-plugin-import
      ;;
    *)
      echo >&2 "unknown: $lang"
      return 1
      ;;
  esac
}

_complete_lintify() {
  compadd go js
}
compdef _complete_lintify lintify


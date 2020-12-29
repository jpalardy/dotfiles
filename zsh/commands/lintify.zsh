
lintify() {
  local lang="$1"
  case "$lang" in
    go)
      cp -v "$DOTFILES/lang/go/golangci.yml" .golangci.yml
      ;;
    js)
      cp -v "$DOTFILES/lang/js/eslintrc" .eslintrc
      npm install --save-dev eslint eslint-config-airbnb-base eslint-plugin-import
      ;;
    *)
      echo >&2 "unknown: $lang"
      return 1
      ;;
  esac
}

_lintify() {
  compadd go js
}
compdef _lintify lintify


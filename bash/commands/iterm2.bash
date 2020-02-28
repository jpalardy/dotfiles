
badge() {
  printf "\e]1337;SetBadgeFormat=%s\a" "$(echo -n "$@" | base64)"
}


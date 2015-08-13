
docker() {
  if [ -z "$DOCKER_HOST" ]; then
    eval "$(boot2docker shellinit)"
  fi
  command docker "$@"
}


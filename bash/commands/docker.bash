
docker() {
  if [ -z "$DOCKER_HOST" ]; then
    eval "$(docker-machine env)"
  fi
  command docker "$@"
}


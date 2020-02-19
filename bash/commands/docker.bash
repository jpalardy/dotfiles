
minizinc() {
  docker run --rm -it -v "$PWD":/data -w /data jpalardy/minizinc minizinc "$@"
}

mysql() {
  docker run -it -v "$PWD":/data -w /data --rm mysql mysql "$@"
}

alf() {
  docker run -ti --name alf --rm amazonlinux-fresh
}

alias dcr="docker-compose run --rm"


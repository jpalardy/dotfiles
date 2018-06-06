
minizinc() {
  docker run --rm -it -v "$PWD":/data -w /data jpalardy/minizinc minizinc "$@"
}

mysql() {
  docker run -it -v "$PWD":/data -w /data --rm mysql mysql "$@"
}


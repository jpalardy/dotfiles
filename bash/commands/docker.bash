
minizinc() {
  docker run --rm -it -v $(pwd):/data -w /data jpalardy/minizinc minizinc "$@"
}

mysql() {
  docker run -it -v $PWD:/data -w /data --rm mysql mysql "$@"
}


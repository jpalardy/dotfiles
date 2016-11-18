
minizinc() {
  docker run --rm -it -v $(pwd):/data -w /data inzinger/minizinc minizinc "$@"
}


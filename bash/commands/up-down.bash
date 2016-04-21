
up() {
  if [ "$1" == "-d" ]; then
    ssh jpalardy.com "cd up-down && rm -v *"
    return
  fi
  if [ -z "$@" ]; then
    ssh jpalardy.com "cd up-down && ls -1"
    return
  fi
  rsync -avz --progress "$@" jpalardy.com:up-down/
}

down() {
  if [ "$1" == "-d" ]; then
    ssh jpalardy.com "cd up-down && rm -v *"
    return
  fi
  if [ -z "$@" ]; then
    ssh jpalardy.com "cd up-down && ls -1"
    return
  fi
  rsync -avz --progress jpalardy.com:up-down/"$@" .
}


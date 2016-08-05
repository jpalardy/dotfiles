
up() {
  if [ "$1" == "-a" ]; then
    rsync -avz --progress * jpalardy.com:up-down/
    return
  fi
  if [ "$1" == "-d" ]; then
    ssh jpalardy.com "cd up-down && rm -rfv *"
    return
  fi
  if [ -z "$@" ]; then
    ssh jpalardy.com "cd up-down && ls -1"
    return
  fi
  rsync -avz --progress "$@" jpalardy.com:up-down/
}

down() {
  if [ "$1" == "-a" ]; then
    rsync -avz --progress jpalardy.com:up-down/* .
    return
  fi
  if [ "$1" == "-d" ]; then
    ssh jpalardy.com "cd up-down && rm -rfv *"
    return
  fi
  if [ -z "$@" ]; then
    ssh jpalardy.com "cd up-down && ls -1"
    return
  fi
  rsync -avz --progress jpalardy.com:up-down/"$@" .
}


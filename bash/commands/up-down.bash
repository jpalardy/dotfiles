
up() {
  local UP_DOWN_HOST="droplet.jpalardy.com"
  if [ "$1" == "-a" ]; then
    rsync -avz --progress ./* $UP_DOWN_HOST:up-down/
    return
  fi
  if [ "$1" == "-d" ]; then
    ssh $UP_DOWN_HOST "cd up-down && rm -rfv *"
    return
  fi
  if [ -z "$1" ]; then
    ssh $UP_DOWN_HOST "cd up-down && ls -1"
    return
  fi
  rsync -avz --progress "$@" $UP_DOWN_HOST:up-down/
}

down() {
  local UP_DOWN_HOST="droplet.jpalardy.com"
  if [ "$1" == "-a" ]; then
    rsync -avz --progress $UP_DOWN_HOST:up-down/* .
    return
  fi
  if [ "$1" == "-d" ]; then
    ssh $UP_DOWN_HOST "cd up-down && rm -rfv *"
    return
  fi
  if [ -z "$1" ]; then
    ssh $UP_DOWN_HOST "cd up-down && ls -1"
    return
  fi
  rsync -avz --progress "$UP_DOWN_HOST:up-down/$1" .
}


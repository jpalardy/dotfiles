#!/bin/bash

set -o nounset  # -u
set -o errexit  # -e
set -o pipefail # ...

# set trap
# trap "rm -f $lockfile; exit" INT TERM EXIT
# remove trap
# trap - INT TERM EXIT

#-------------------------------------------------

usage() {
  cat >&2 <<EOM
Usage: $(basename "$0") [OPTION]...

  -a VALUE    argument description
              line two
              line three
  -b VALUE    argument description
  -c          switch description
              line two
  -d          switch description
              line two
              line three
              line four
  -h          display help
EOM
  # shellcheck disable=SC2086
  exit ${1:-0}
}

# init switch flags
c=0
d=0

while getopts "a:b:cdh" opt; do
  case "$opt" in
    a)
      # shellcheck disable=SC2034
      a=$OPTARG
      ;;
    b)
      # shellcheck disable=SC2034
      b=$OPTARG
      ;;
    c)
      # shellcheck disable=SC2034
      c=1
      ;;
    d)
      # shellcheck disable=SC2034
      d=1
      ;;
    h|*)
      usage 0
      ;;
  esac
done

shift $((OPTIND - 1))

# -------------------------------------------------

confirm() {
  local msg=$1
  while true; do
    read -p "$msg (Y/n) " -r
    case $REPLY in
      Y | y | "")
        return 0
        ;;
      N | n)
        return 1
        ;;
    esac
  done
}

if ! confirm "reboot?"; then
  exit 0
fi


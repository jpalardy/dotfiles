#!/bin/bash

set -o nounset  # -u
set -o errexit  # -e
set -o pipefail # ...

# set trap
# trap "rm -f $lockfile; exit" INT TERM EXIT
# remove trap
# trap - INT TERM EXIT


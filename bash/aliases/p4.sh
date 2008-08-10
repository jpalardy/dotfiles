
function p4_status() {
  find ${1:-.} -type f | p4 -x- have | grep 'not on client'
}


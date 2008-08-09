
function aes_enc() {
  if [ -z "$1" ]; then
    openssl enc -e -aes-256-cbc -a -salt
  else
    openssl enc -e -aes-256-cbc -a -salt -in $1 -out $1.aes
  fi
}

function aes_dec() {
  if [ -z "$1" ]; then
    openssl enc -d -aes-256-cbc -a -salt
  else
    openssl enc -d -aes-256-cbc -a -salt -in $1 -out ${1%%.aes}
  fi
}


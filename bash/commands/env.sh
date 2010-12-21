
env_sqlite() {
  local filename="$HOME/.source.sh"

  cat > $filename <<END

export DB_ADAPTER="sqlite"
export DB_FILENAME="${DB_FILENAME}"

END

  $EDITOR $filename
  source $filename
}

env_mysql() {
  local filename="$HOME/.source.sh"

  cat > $filename <<END

export DB_ADAPTER="mysql"
export DB_HOST="${DB_HOST}"
export DB_NAME="${DB_NAME}"
export DB_USER="${DB_USER}"

END

  $EDITOR $filename
  source $filename
}


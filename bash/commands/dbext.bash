
dbext_profile() {
  local tmpfile=$(mktemp -t tmp)
  trap "rm -f $tmpfile" EXIT INT TERM HUP

  cat > $tmpfile <<END

export DBEXT_PROFILE="'type=SQLITE:dbname=db/development.sqlite3'"
export DBEXT_PROFILE="'type=MYSQL:host=127.0.0.1:port=3306:user=root:dbname=slam:passwd=@askb'"

END

  $EDITOR $tmpfile
  source $tmpfile
  rm -f $tmpfile
}


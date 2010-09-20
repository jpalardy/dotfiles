
# ensure(command)
ensure() {
  if [ -z "$(which $1)" ]; then
    echo "missing command $1"
    exit 1
  fi
}

# ensure_and_setup(original_command, command)
ensure_and_setup() {
  ensure $1
  ln -v -s $(which $1) $HOME/local/bin/$2
}

#-------------------------------------------------

if [ ! -d "$HOME/local/bin" ]; then
  echo "missing directory" "$HOME/local/bin"
fi

ensure_and_setup gls   ls
ensure_and_setup gtac  tac
ensure_and_setup gfind find
ensure_and_setup gdu   du
ensure_and_setup gsed  sed


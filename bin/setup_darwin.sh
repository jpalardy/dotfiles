
# ensure_command(command)
ensure_command() {
  if [ -z "$(which $1)" ]; then
    echo "missing command $1"
    exit 1
  fi
}

# ensure_directory(directory)
ensure_directory() {
  if [ ! -d "$1" ]; then
    echo "missing directory $1"
    exit 1
  fi
}

# ensure_and_setup(original_command, command)
ensure_and_setup() {
  ensure_command $1
  ln -v -s $(which $1) $HOME/local/bin/$2

  local old_man_path=$(man -w $1)
  local new_man_path=$(echo $old_man_path | sed s/$1/$2/ | sed s_.*share/man_$HOME/local/share/man_)
  ln -v -s $old_man_path $new_man_path
}

#-------------------------------------------------

ensure_directory "$HOME/local/bin"
ensure_directory "$HOME/local/share/man"

ensure_and_setup gls   ls
ensure_and_setup gtac  tac
ensure_and_setup gfind find
ensure_and_setup gdu   du
ensure_and_setup gsed  sed
ensure_and_setup gseq  seq


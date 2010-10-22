
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

# safe_ln(src, dst)
safe_ln() {
  if [ -L $2 ]; then
    return
  fi

  ln -vs $1 $2
}

# ensure_and_link(original_command, command)
ensure_and_link() {
  ensure_command $1

  safe_ln $(which $1) $HOME/local/bin/$2

  local old_man_path=$(man -w $1)
  local new_man_path=$(echo $old_man_path | sed s/$1/$2/ | sed s_.*share/man_$HOME/local/share/man_)

  safe_ln $old_man_path $new_man_path
}

#-------------------------------------------------

ensure_directory "$HOME/local/bin"
ensure_directory "$HOME/local/share/man/man1"

ensure_and_link gls   ls
ensure_and_link gtac  tac
ensure_and_link gfind find
ensure_and_link gdu   du
ensure_and_link gsed  sed
ensure_and_link gseq  seq
ensure_and_link gawk  awk


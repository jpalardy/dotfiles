
cond_source() {
  if [ -f "$1" ]; then
    source "$1"
  fi
}

source_all() {
  for file in "$@"; do
    source "$file"
  done
}

# variables
source      "$HOME"/.bash/variables.bash
cond_source "$HOME"/.bash/local/variables.bash

# shell is interactive?
if [[ $- =~ i ]]; then
  # completion
  source_all  "$HOME"/.bash/completion/*

  # commands
  source_all  "$HOME"/.bash/commands/*
  cond_source "$HOME"/.bash/local/commands.bash

  # shell behavior
  source      "$HOME"/.bash/shell.bash
  cond_source "$HOME"/.bash/local/shell.bash

  # prompt
  source      "$HOME"/.bash/prompt.bash
  cond_source "$HOME"/.bash/local/prompt.bash
fi

#-------------------------------------------------

# iterm can start in different places
# but not in tmux, because that's expected
if [ "$PWD" != "$HOME" ] && [ -z "$TMUX_PANE" ]; then
  PATH_COLOR=$(tput setaf 1) echo_pwd
fi

#-------------------------------------------------

unset cond_source
unset source_all



function cond_source () {
  [ -f $1 ] && . $1
}

# variables
source      $HOME/.bash/variables.bash
cond_source $HOME/.bash/local/variables.bash

# shell is interactive?
if [[ $- =~ i ]]; then
  # completion
  for file in $HOME/.bash/completion/*; do
    source $file
  done

  # commands
  for file in $HOME/.bash/commands/*; do
    source $file
  done
  cond_source $HOME/.bash/local/commands.bash

  # shell behavior
  source      $HOME/.bash/shell.bash
  cond_source $HOME/.bash/local/shell.bash

  # prompt
  source      $HOME/.bash/prompt.bash
  cond_source $HOME/.bash/local/prompt.bash
fi

#source .bash/rvm.bash



function cond_source () {
  [ -f $1 ] && . $1
}

# variables
source      $HOME/.bash/variables.bash
cond_source $HOME/.bash/local/variables.bash

# shell is interactive?
if [[ $- =~ i ]]; then
  # commands
  for file in $HOME/.bash/commands/*; do
    source $file
  done
  cond_source $HOME/.bash/local/commands.bash

  # completion
  for file in $HOME/.bash/completion/*; do
    source $file
  done

  BASH_COMPLETION=${BASH_COMPLETION:-/usr/local/etc/bash_completion}
  if [ -e $BASH_COMPLETION ]; then
    source $BASH_COMPLETION
    complete -r vim
  else
    echo "no bash-completion"
  fi

  # shell behavior
  source      $HOME/.bash/shell.bash
  cond_source $HOME/.bash/local/shell.bash

  # prompt
  source      $HOME/.bash/prompt.bash
  cond_source $HOME/.bash/local/prompt.bash
fi


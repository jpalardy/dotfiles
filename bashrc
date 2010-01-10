
function cond_source () {
  [ -f $1 ] && . $1
}

# variables
source      $HOME/.bash/variables.sh
cond_source $HOME/.bash/local/variables.sh

# shell is interactive?
if [[ $- =~ i ]]; then
  # commands
  for file in $HOME/.bash/commands/*; do
    source $file
  done
  cond_source $HOME/.bash/local/commands.sh

  # completion
  for file in $HOME/.bash/completion/*; do
    source $file
  done

  # shell behavior
  source      $HOME/.bash/shell.sh
  cond_source $HOME/.bash/local/shell.sh

  # prompt
  source      $HOME/.bash/prompt.sh
  cond_source $HOME/.bash/local/prompt.sh
fi


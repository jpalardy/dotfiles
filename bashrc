
function cond_source () {
  [ -f $1 ] && . $1
}

# variables

source      $HOME/.bash/variables.sh
cond_source $HOME/.bash/local/variables.sh

# shell is interactive?

if [[ $- =~ i ]]; then
  source      $HOME/.bash/interactive.sh
  cond_source $HOME/.bash/local/interactive.sh
fi


############################################################
# SOURCE IF EXISTS
############################################################

function cond_source () {
  [ -f $1 ] && . $1
}

############################################################
# VARIABLES AND MISC                                       #
############################################################

source $HOME/.bash/variables.sh
cond_source $HOME/.bash/local/variables.sh

############################################################
# ALIASES                                                  #
############################################################

for file in $HOME/.bash/aliases/*.sh; do
  source $file
done

cond_source $HOME/.bash/local/aliases.sh

############################################################
# COMPLETIONS                                              #
############################################################

for file in $HOME/.bash/completion/*; do
  source $file
done

############################################################
# BINDINGS                                                 #
############################################################

source      $HOME/.bash/bindings.sh
cond_source $HOME/.bash/local/bindings.sh


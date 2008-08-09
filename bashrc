############################################################
# USEFUL FUNCTION                                          #
############################################################

. $HOME/.bash/lib/util.sh

############################################################
# VARIABLES AND MISC                                       #
############################################################

shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s progcomp

#-------------------------------------------------

umask 22
ulimit -c 0

PS1="\[\e[37;42m\]\h@\t\[\e[0m\] "

#-------------------------------------------------

export PATH="$HOME/etc/bin:$HOME/bin:/opt/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin"

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-9"
export RUBYLIB="$HOME/lang/ruby/lib"

export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000
export HISTSIZE=1000

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


#-------------------------------------------------
# SETTINGS
#-------------------------------------------------

umask 22
ulimit -c 0

#-------------------------------------------------
# VARIABLES
#-------------------------------------------------

set -x DOTFILES "$HOME/dotfiles"

set -x EDITOR "vim"
set -x PAGER "less"
set -x BLOCKSIZE "K"

set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x RLWRAP_HOME "$HOME/.rlwrap"
set -x FZF_DEFAULT_OPTS "--reverse --info=hidden --height=20 --cycle --border --multi"
set -x CLICOLOR 1    # used by `tree`, possibly others

set -x MANPAGER "manpager"

#-------------------------------------------------
# PATHs
#-------------------------------------------------

fish_add_path -g "$HOME/local/bin"
fish_add_path -g "$DOTFILES/bin"


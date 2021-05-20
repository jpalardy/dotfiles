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

if set -q TMUX
  set -x TERM "screen-256color"
else
  set -x TERM "xterm-256color"
end

set -x RLWRAP_HOME "$HOME/.rlwrap"
set -x FZF_DEFAULT_OPTS "--reverse --info=hidden --height=20 --cycle --border --multi"
set -x CLICOLOR 1    # used by `tree`, possibly others

set -x MANPAGER "col -b | vim -c 'set ft=man ts=8 nomod noma' -"

#-------------------------------------------------
# PATHs
#-------------------------------------------------

set -x PATH
set -x MANPATH

for dir in $DOTFILES "$HOME/local" "/usr/local" "/usr" "" "/usr/X11"
  fish_add_path -a -g $dir/{sbin,bin}
  if test -d "$dir/share/man"
    set MANPATH $MANPATH "$dir/share/man"
  end
end

# asdf
fish_add_path -g "$HOME/.asdf/shims"

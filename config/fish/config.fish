
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

#-------------------------------------------------
# PROMPT
#-------------------------------------------------

set -U color_host normal
set -U color_cwd 626262
set fish_greeting

set -g fish_escape_delay_ms 1000

#-------------------------------------------------
# LOCAL
#-------------------------------------------------

if test -e "$DOTFILES/config/fish/local.fish"
  source "$DOTFILES/config/fish/local.fish"
end


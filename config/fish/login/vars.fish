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
set -x BLOCKSIZE "K"

set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x RLWRAP_HOME "$HOME/.rlwrap"
set -x FZF_DEFAULT_OPTS "--reverse --info=hidden --height=20 --cycle --border --multi --exact"
set -x FZF_CTRL_T_COMMAND "rg --files --no-ignore-parent --sort path"
set -x CLICOLOR 1    # used by `tree`, possibly others
set -x RIPGREP_CONFIG_PATH ~/dotfiles/ripgreprc

set -x MANPAGER "nvim +Man!"

#-------------------------------------------------
# PROMPT
#-------------------------------------------------

set -g fish_prompt_pwd_dir_length 0

set -g __fish_git_prompt_showcolorhints true
set -g __fish_git_prompt_showupstream verbose
set -g __fish_git_prompt_char_upstream_ahead '+'
set -g __fish_git_prompt_char_upstream_behind '-'

set -g __fish_git_prompt_show_informative_status 1

set -g __fish_git_prompt_color_cleanstate green

set -g __fish_git_prompt_showdirtystate true
set -g __fish_git_prompt_char_dirtystate 'M'
set -g __fish_git_prompt_color_dirtystate yellow

set -g __fish_git_prompt_showuntrackedfiles true
set -g __fish_git_prompt_char_untrackedfiles '?'

#-------------------------------------------------
# PATHs
#-------------------------------------------------

fish_add_path -g "/opt/homebrew/bin"
fish_add_path -g "$HOME/local/bin"
fish_add_path -g "$DOTFILES/bin"
fish_add_path -g "$DOTFILES/bin/local"


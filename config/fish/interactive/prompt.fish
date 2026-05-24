set fish_greeting
set -g fish_escape_delay_ms 1000

set -g color_host normal
set -g color_cwd 626262

#-------------------------------------------------
# RIGHT PROMPT
#-------------------------------------------------

set -g fish_prompt_pwd_dir_length 0

# git details

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


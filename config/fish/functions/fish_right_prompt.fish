function fish_right_prompt
  set -l normal (set_color normal)
  set -q fish_prompt_pwd_dir_length; or set -lx fish_prompt_pwd_dir_length 0

  echo -n -s (set_color $color_cwd) (prompt_pwd) $normal (fish_git_prompt) $normal
end

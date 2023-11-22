function fish_right_prompt
  set -l normal (set_color normal)
  echo -n -s (set_color $color_cwd) (prompt_pwd) $normal (fish_git_prompt)
end

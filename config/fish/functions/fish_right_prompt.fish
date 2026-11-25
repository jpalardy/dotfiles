function fish_right_prompt
  printf "%s%s%s%s" (set_color $color_cwd) (prompt_pwd) (set_color normal) (fish_git_prompt)
end

function fish_user_key_bindings
  fzf_key_bindings
  set -gx FZF_CTRL_T_COMMAND "rg --files --no-ignore-parent --sort-files"
end

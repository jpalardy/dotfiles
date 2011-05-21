
if [ -d "$HOME/.rvm" ]; then
  rvm_reload_flag=1
  source $HOME/.rvm/scripts/rvm
  source $HOME/.rvm/scripts/completion

  cd() {
    better_cd "$@"
    result=$?
    __rvm_project_rvmrc
    return $result
  }

  alias rgl="rvm gemset list"
fi


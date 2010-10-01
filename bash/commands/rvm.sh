
if [ -d "$HOME/.rvm" ]; then
  source $HOME/.rvm/scripts/rvm
  source $HOME/.rvm/scripts/completion

  cd() {
    cd_pushd "$@"
    result=$?
    __rvm_project_rvmrc
    return $result
  }
fi



function ssh_hosts() {
  cat ~/.ssh/config | awk '/^Host [^*]/ {print $2}'
}

# pick from directories in $HOME/.gorc and cd into it
function _ssh() {
  pick_with_vim "ssh_hosts" "ssh" $1
}


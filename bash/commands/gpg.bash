
gpg_agent() {
  case "$1" in
    start )
      gpg-agent --write-env-file --daemon
      ;;
    stop )
      if [ -e $HOME/.gpg-agent-info ]; then
        pid=$(cat $HOME/.gpg-agent-info | awk -F: '{print $2}')
        kill $pid
        rm $HOME/.gpg-agent-info
      fi
      ;;
    restart )
      gpg_agent stop
      gpg_agent start
      ;;
    * ) echo 1>&2 "gpg_agent [start|restart|stop]"
  esac
}

gpg_agent_env() {
  if [ -e $HOME/.gpg-agent-info ]; then
    source $HOME/.gpg-agent-info
    export GPG_AGENT_INFO
  fi
}
gpg_agent_env


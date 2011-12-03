
if [ -n "$TMUX" ]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

ATTR_RESET=$(tput sgr0)

PS1='\[${PS1_COLOR}\]\h\[${ATTR_RESET}\] '

simple_PS1() {
  PS1='\[${PS1_COLOR}\]#\[${ATTR_RESET}\] '
}


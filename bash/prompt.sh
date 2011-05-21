
export TERM="xterm-256color"

ATTR_RESET=$(tput sgr0)

PS1='\[${PS1_COLOR}\]\h\[${ATTR_RESET}\] '


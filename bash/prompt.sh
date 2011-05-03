
export TERM="xterm-256color"

CURSOR_SAVE=$(tput sc)
CURSOR_RESTORE=$(tput rc)

ATTR_RESET=$(tput sgr0)

prompt_command() {
  printf "${ATTR_RESET}"
  printf "${PATH_COLOR}%*s" $COLUMNS "$(__git_ps1 "%s -- ")$PWD"
  printf "${ATTR_RESET}"
}

PS1='${PS1_COLOR}\u@\h${ATTR_RESET} '
PROMPT_COMMAND=prompt_command


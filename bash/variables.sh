
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s progcomp

#-------------------------------------------------

umask 22
ulimit -c 0

#-------------------------------------------------

export PATH="$HOME/etc/bin:$HOME/bin:/opt/local/sbin:/opt/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/X11R6/bin"
export MANPATH="/opt/local/share/man:$MANPATH"

export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

export GZIP="-9"

export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000
export HISTSIZE=1000

ATTR_RESET=$(tput sgr0)

CURSOR_SAVE=$(tput sc)
CURSOR_RESTORE=$(tput rc)

PS1_COLOR=$(tput setaf 166)  # orange
PATH_COLOR=$(tput setaf 236) # gray

prompt_command() {
  printf "${CURSOR_SAVE}"
  printf "${ATTR_RESET}"
  printf "${PATH_COLOR}%*s" $COLUMNS "$(__git_ps1 "%s -- ")$PWD"
  printf "${ATTR_RESET}"
  printf "${CURSOR_RESTORE}"
}

PS1='\[${PS1_COLOR}\]\u@\h\[${ATTR_RESET}\] '
PROMPT_COMMAND=prompt_command

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export TERM="xterm-256color"

export FIND_OPTIONS="-name .git -prune -o -name .hg -prune -o -name *.swp -prune -o"

export DB_HOST="localhost"
export DB_ADAPTER="sqlite"
export DB_NAME="db/development.sqlite3"
export DB_USER=""

export AMAZON_ACCESS_KEY_ID=""
export AMAZON_SECRET_ACCESS_KEY=""


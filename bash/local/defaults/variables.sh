
prompt_command() {
  printf "\e[30;40;1m%*s\n\e[0m\e[1A" $COLUMNS "$(__git_ps1 "%s --") $PWD"
}

PS1="\[\e[31;43m\]\u@\h\[\e[0m\] "
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


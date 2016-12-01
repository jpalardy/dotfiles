
anybar() {
  echo -n $1 | nc -4u -w0 localhost ${2:-1738}
}

alias .r="anybar white"
alias .d="anybar purple"


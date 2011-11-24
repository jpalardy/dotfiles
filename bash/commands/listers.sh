
# bash meta-programming, make it generate some redundant functions
lister() {
  local name=$1
  local command=$2
  local filter=${3:-cat}

cat > $HOME/.source <<END
${name}() {
  local SOURCE="\$HOME/.lists/${name}"
  if [ ! -f "\$SOURCE" ]; then
    echo "\$SOURCE does not exist..."
    return 1
  fi

  FILTER="${filter}" pick_with_vim "cat \$SOURCE" "${command}" \$1
}
END

source $HOME/.source
}

#-------------------------------------------------

lister "go"   "cd"
lister "qc"   "eval"
lister "rg"   "rvm use"
lister "warp" "ssh"     "awk '{print \\\$1}'"


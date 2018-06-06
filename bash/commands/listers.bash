
# this function only exists for the duration of this file -- check unset below
GENERATE_lister() {
  local name=$1
  local command=$2
  local filter=${3:-cat}
  eval "
    ${name}() {
      local SOURCE=\"\$HOME/.lists/${name}\"
      if [ ! -f \"\$SOURCE\" ]; then
        echo \"\$SOURCE does not exist...\"
        return 1
      fi

      FILTER=\"${filter}\" pick_with_vim \"cat \$SOURCE\" \"${command}\" \$1
    }
  "
}

GENERATE_lister "g" "cd"
GENERATE_lister "qc"

for i in $(seq 10); do
  alias g$i="g $i"
done

unset GENERATE_lister


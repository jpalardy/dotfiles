#!/bin/bash

module_name() {
  echo "$1" | sed -e 's_^lib\/__' -e 's/\.ex$//' | awk '
    function join(array, sep) {
      result = array[1]
      for (i = 2; i <= length(array); i++) {
        result = result sep array[i]
      }
      return result
    }

    function capitalize(word) {
      return toupper(substr(word, 1, 1)) tolower(substr(word, 2))
    }

    {
      split($0, parts, "/")
      for (i = 1; i <= length(parts); i++) {
        parts[i] = capitalize(parts[i])
      }
      print join(parts, ".")
    }
  '
}

cat <<EOF
defmodule $(module_name "$1") do
  def hello do
    :world
  end
end
EOF

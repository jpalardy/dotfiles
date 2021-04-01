#!/bin/bash

# lib/text_client/prompter.ex -> TextClient.Prompter
# - remove leading "lib/", trailing ".ex"
# - upcase first letter, and letters after _ or /
# - remove _
# - replace / with .

module_name() {
  echo "$1" | sed -E -e 's#(^lib/|\.ex$)##g' -e 's#((^|[_/]).)#\U\1#g' -e 's#_##g' -e 's#/#.#g'
}

cat <<EOF
defmodule $(module_name "$1") do
  def hello do
    :world
  end
end
EOF

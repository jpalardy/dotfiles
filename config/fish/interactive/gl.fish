function gl
  set -l path "$HOME/Downloads"
  set -q argv[1]; and set path (string replace -r '/$' '' $argv[1])

  ls -t $path | fzf --multi | while read -l r; set results $results $r; end
  for r in $results
    mv -v "$path/$r" .
  end
end

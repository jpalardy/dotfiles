function __fzf_contextual
  # nodejs
  if [ -e "package.json" ]
    echo "npm outdated"
    echo "ncu -u"
    echo "npm install"
    echo "git add package*; npm audit fix; rm -rf package-lock.json node_modules; npm install"
    echo "npm install -g typescript typescript-language-server"
  end

  # elm
  if [ -e "elm.json" ]
    echo "npm install -g @elm-tooling/elm-language-server"
  end

  # go
  if [ -e "go.mod" ]
    echo "go get -u"
    echo "go mod tidy"
  end

  # elixir
  if [ -e "mix.exs" ]
    echo "mix deps.get"
    echo "mix deps.compile"
    echo "mix format --migrate"
    echo "mix hex.outdated"
    echo "mix deps.update --all; and mix deps.unlock --unused"
    echo ""
    test -d .elixir_ls; and echo "rm -rf -v .elixir_ls"
    test -d _build;     and echo "rm -rf -v _build"
    test -d deps;       and echo "rm -rf -v deps"
  end

  # vimrepl
  test -e "report.Rmd"; and echo "vimrepl Rmd -c R -f report.Rmd"
  for f in _vimrepl.*
    echo "vimrepl $(string replace '_vimrepl.' '' $f)"
  end
end

function fzf-contextual
  __fzf_contextual | fzf --multi --exit-0 | while read -l r; set result $result $r; end
  and commandline -- $result

  commandline -f repaint
end

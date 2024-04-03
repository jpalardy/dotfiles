function __fzf_contextual
  # nodejs
  if [ -e "package.json" ]
    echo "npm outdated"
    echo "ncu -u; and npm install; and git add package*; and npm audit fix; and rm -rf package-lock.json node_modules; and npm install"
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
    echo "mix deps.update --all; and mix deps.unlock --unused"
    echo ""
    test -d .elixir_ls; and echo "rm -rf -v .elixir_ls"
    test -d _build;     and echo "rm -rf -v _build"
    test -d deps;       and echo "rm -rf -v deps"
  end

  # gleam
  if [ -e "gleam.toml" ]
    echo "gleam build"
    echo "gleam test"
    echo "gleam format"
    echo "gleam clean"
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

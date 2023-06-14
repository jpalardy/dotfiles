function __fzf_contextual
  # nodejs -related
  if [ -e "package.json" ]
    echo "npm outdated"
    echo "ncu -u; npm install; git add package*; npm audit fix"
    echo "rm package-lock.json; npm install"
  end
  # go -related
  if [ -e "go.mod" ]
    echo "go get -u"
    echo "go mod tidy"
  end
  # elixir
  if [ -e "mix.exs" ]
    echo "mix deps.get; and mix deps.compile"
    echo "mix deps.get"
    echo ""
    test -d .elixir_ls && echo "rm -rf -v .elixir_ls"
    test -d _build     && echo "rm -rf -v _build"
    test -d deps       && echo "rm -rf -v deps"
  end
  # vimrepl
  test -e "report.Rmd" && echo "vimrepl Rmd -c R -f report.Rmd"
  for f in _vimrepl.*
    echo "vimrepl $(string replace '_vimrepl.' '' $f)"
  end
end

function fzf-contextual
  __fzf_contextual | fzf --multi --exit-0 | while read -l r; set result $result $r; end
  and commandline -- $result

  commandline -f repaint
end

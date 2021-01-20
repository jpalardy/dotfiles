
go-types() {
  command rg '^type\b' -g '!*_test.go' --no-heading
}

go-overview() {
  echo "$(fne go | wc -l) files, $(fne go | grep -c _test.go$) tests"
  echo "$(fne go | xargs cat | wc -l) lines"
  rg '^package main\b' -l | awk '!header {print "mains:"; header=1} {print "- " $0}'
}

go-get-bin() {
  GOPATH=$PWD go get -v "$1"
  cd bin || return
}

alias go-lintall="golangci-lint run --enable-all -v"

go-format() {
  local flag="${1:-"-l"}"
  gofmt -s "$flag" .
  goimports "$flag" .
  gofumpt -s "$flag" .
}

go-src() {
  cd "$(go env GOROOT)/src"
}

go-tools-howto() {
  echo '
    cd ~/go/
    go get mvdan.cc/gofumpt
    go get golang.org/x/tools/cmd/goimports
  '
}


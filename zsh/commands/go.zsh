
go-get-bin() {
  GOPATH=$PWD go get -v "$1"
  cd bin || return
}

alias go-lintall="golangci-lint run --enable-all -v --color=always"

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


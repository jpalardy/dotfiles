
gopath() {
  export GOPATH="$PWD"
  export PATH="$PWD/bin:$PATH"
}

go-where-main() {
  rg 'package main' -l
}

go-types() {
  rg '^type \w+' | awk '{print $3}' | sort | uniq -c | sort -nr
}

go-project-summary() {
  echo "files:" $(fne go | wc -l) "($(fne go | grep _test.go$ | wc -l) tests)"
  echo "lines:" $(fne go | xargs cat | wc -l)
}

gofmt-no-vendor() {
  find . -type f -name '*.go' -not -path "./vendor/*" -print0 | xargs -0 gofmt -s -l "$@"
}


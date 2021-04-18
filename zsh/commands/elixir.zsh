
# [i]ex -S [m]ix
alias im="iex -S mix"

alias mtff="mix test --seed 0 --max-failures 1"

#-------------------------------------------------
# exercism helpers...
#-------------------------------------------------

alias vu='vim $(ff | rg ex | rg -v -e test_helper -e mix.exs) -O'

fix-pending() {
  sed -E -e 's/^( +)@tag :pending/\1# @tag :pending/' --in-place $(find test -name '*_test.exs')
}


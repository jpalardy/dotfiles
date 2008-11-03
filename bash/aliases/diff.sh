

function diff_ru_m() {
  diff -ru "$@" | grep 'diff -ru' | sed -e 's/^diff -ru/vimdiff/' | column -t
}

function diff_ru_ar() {
  diff -ru "$@" | grep 'Only in' | sed -e 's/^Only in //' | sort
}


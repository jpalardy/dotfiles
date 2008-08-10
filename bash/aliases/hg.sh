
function hg_diff() {
  hg diff "$@" | vim -R -
}

function hg_log() {
  hg log "$@" | vim -R -
}

function hg_revert_trim() {
  (cd `hg root`; hg st -n | grep 'orig$' | xargs rm -v)
}

function hg_st() {
  hg st; hg st -i
}

function _hg() {
  cat "$@" | grep -v '/\.hg/'
}


function hg_vimdiff {
 vimdiff $1 <(hg cat $1)
}

function hg_ios {
  multitail -l 'hg in; cat' -l 'hg out; cat' -l 'hg st; cat'
}


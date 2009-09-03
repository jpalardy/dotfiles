
function rake_cache() {
  rake -T > .rake_t_cache
}

function rake_cache_clear() {
  if [ -e ".rake_t_cache" ]; then
    rm .rake_t_cache
  fi
}


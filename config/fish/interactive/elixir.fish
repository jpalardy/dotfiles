function mix-wipe
  for dir in _build deps
    test -d $dir; and rm -rv $dir
  end
  if read_confirm "Fetch and compile?"
    mix deps.get
    mix compile
  end
end

#-------------------------------------------------
# LOGIN
#-------------------------------------------------

if status --is-login
  for file in (status dirname)/login/*.fish
    source $file
  end
end

#-------------------------------------------------
# INTERACTIVE
#-------------------------------------------------

if status --is-interactive
  for file in (status dirname)/interactive/*.fish
    source $file
  end
end

#-------------------------------------------------
# LOCAL
#-------------------------------------------------

for file in (status dirname)/local/*.fish
  source $file
end

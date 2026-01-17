new-window
rename-window "name"
send-keys "..." C-m

select-layout even-vertical
select-layout even-horizontal
select-layout main-horizontal
select-layout main-vertical
select-layout tiled

select-pane -t 0
select-window -t 0

split-window -v    # default
split-window -h

# -------------------------------------------------

rename-window "_build_"
send-keys "make watch" C-m

split-window -h
send-keys "cd public; serve" C-m

split-window -h
send-keys "make tailwind" C-m

select-layout even-vertical

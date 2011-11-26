
# behavior

shopt -s checkhash               # build a hash of the commands in PATH, look there first, in PATH after
shopt -s checkwinsize            # automatically update the values of LINES and COLUMNS

shopt -s cmdhist                 # save a multiple-line command in the same history entry
shopt -s histappend              # append (rather than overwrite) the HISTFILE when the shell exits

shopt -s no_empty_cmd_completion # don't look in PATH if I haven't typed anything
shopt -s progcomp                # programmable completion (should be enabled by default)

HISTSIZE=1000                    # history lines in memory
HISTFILESIZE=1000                # history lines in the file
HISTCONTROL=ignoreboth           # don't save lines starting with a space, or duplicate lines

# bindings

bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# the dreaded backspace
bind '"\C-?": backward-delete-char'
stty erase ^?


# Display current command at the top of terminal window or tab
trap 'echo -ne "\033]2;$(history 1 | sed "s/^[0-9 ]* \+//")\007"' DEBUG

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

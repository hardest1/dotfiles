# Useful aliases

# alias for dotfiles bare repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias publicip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"

# List all make targets.
alias make_list="make -qp | sed -n -e 's/^\([^.#[:space:]][^:[:space:]]*\): .*/\1/p'"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# shorts for traversing file system
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# humanize output
alias ddd='du -h -d1'
alias du='du -h'
alias df='df -h'

# Blockbook / Chain49 dev
alias bbb='systemctl list-units | grep -e blockbook -e backend'

# asciicast2gif
alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'
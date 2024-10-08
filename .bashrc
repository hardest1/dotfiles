# Display current command at the top of terminal window or tab
trap 'echo -ne "\033]2;$(history 1 | sed "s/^[0-9 ]* \+//")\007"' DEBUG

# alias for dotfiles bare repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# add .bin folder to path
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Start SSH Agent
#----------------------------

SSH_ENV="$HOME/.ssh/environment"

function run_ssh_env {
  . "${SSH_ENV}" > /dev/null
}
function start_ssh_agent {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo "succeeded"
  chmod 600 "${SSH_ENV}"
  run_ssh_env;
}

if [ -f "${SSH_ENV}" ]; then
  run_ssh_env;
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_ssh_agent;
  }
else
  start_ssh_agent;
fi

# Add all keys quietly
ssh-add ~/.ssh/* &> /dev/null

# HETZNER .bashrc
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=999999
HISTFILESIZE=999999

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Check if we are connected via SSH which means we are on a remote machine
is_remote=
if [ -n "$SSH_CLIENT" ]; then
  is_remote="SSH "
fi
#echo "check if remote done"

# Stuff to do on non-windows systems (set fancy prompt, symlinks)
if [ "$OSTYPE" != msys ]; then

  # Install Ruby Gems to ~/gems
  export GEM_HOME="$HOME/gems"
  export PATH="$HOME/gems/bin:$PATH"

  # Create symlinks and directories
  # for ngrok
  [ ! -d "$HOME/.config/ngrok" ] && mkdir -p "$HOME/.config/ngrok";
  [ ! -f "$HOME/.config/ngrok/ngrok.yml" ] && ln -s "$HOME/AppData/Local/ngrok/ngrok.yml" "$HOME/.config/ngrok/ngrok.yml";
  # for hyper terminal
  [ ! -f "$HOME/.hyper.js" ] && ln -s "$HOME/AppData/Roaming/Hyper/.hyper.js" "$HOME/.hyper.js";


  # Overwrite prompt if we are not on Windows / Git Bash because we already have a fancy prompt there
  if [ "$color_prompt" = yes ]; then
      PS1="${debian_chroot:+($debian_chroot)}"
      PS1="$PS1\[\033[01;32m\]$is_remote"
      PS1="$PS1\[\033[01;31m\]\u"
      PS1="$PS1\[\033[01;33m\]@"
      PS1="$PS1\[\033[01;36m\]\h "
      PS1="$PS1\[\033[01;33m\]\w "
      PS1="$PS1\[\033[01;35m\]\$ "
      PS1="$PS1\[\033[00m\]"
  else
      PS1="${debian_chroot:+($debian_chroot)}"
      PS1='\u@\h$is_remote\w \$ '
  fi
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias and function defs
for file in ~/.{bash_aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# bun.sh
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH


echo "DONE"
clear
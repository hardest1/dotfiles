PROMPT_COMMAND='history -a'

# Display current command at the top of terminal window or tab
trap 'echo -ne "\033]2;$(history 1 | sed "s/^[0-9 ]* \+//")\007"' DEBUG

# alias for dotfiles bare repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# add .bin folder to path
[ ! -d "$HOME/.bin" ] && mkdir -p "$HOME/.bin";
export PATH="$HOME/.bin:$PATH"

[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin";
export PATH="$HOME/.local/bin:$PATH"

# Start SSH Agent
#----------------------------

# SSH_ENV="$HOME/.ssh/environment"

# function run_ssh_env {
#   . "${SSH_ENV}" > /dev/null
# }
# function start_ssh_agent {
#   echo "Initializing new SSH agent..."
#   ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#   echo "succeeded"
#   chmod 600 "${SSH_ENV}"
#   run_ssh_env;
# }

# if [ -f "${SSH_ENV}" ]; then
#   run_ssh_env;
#   ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#     start_ssh_agent;
#   }
# else
#   start_ssh_agent;
# fi

# # Add all keys quietly
# ssh-add ~/.ssh/* &> /dev/null

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
color_prompt=yes

# Check if we are connected via SSH which means we are on a remote machine
is_remote=
if [ -n "$SSH_CLIENT" ]; then
  is_remote="SSH "
fi
#echo "check if remote done"


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

# BASH COMPLETION SCRIPTS

# KUBECTX
_kube_contexts()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "- $(kubectl config get-contexts --output='name')" -- $curr_arg ) );
}
complete -F _kube_contexts kubectx kctx

_kube_namespaces()
{
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}')" -- $curr_arg ) );
}

complete -F _kube_namespaces kubens kns

echo "DONE"
clear
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
TEAL="$(tput setaf 10)"
SALMON="$(tput setaf 12)"
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
PS1='\[${GREEN}\]\u\[${SALMON}\]@\[${TEAL}\]\h\[$RESET\] \W\$ '
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
alias feh='feh -. -Z --auto-rotate'
export GOPATH=/media/go/
alias vi='vim'

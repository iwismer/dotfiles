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
alias update='pacaur -Syu'
export GOPATH=/media/go/
alias backup='rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*/.cache/*","/home/*/.local/share/Trash/*","/home/*/.thumbnails/*"} --delete / /run/media/isaac/Isaac-ITX\ Backup/Backups/Arch/'
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
alias vpn='openconnect vpn.uoguelph.ca'
alias vi='vim'

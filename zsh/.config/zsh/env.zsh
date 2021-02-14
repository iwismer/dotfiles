export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

# Set path
typeset -U PATH path
path=(
	"$HOME/.local/bin"
	"$HOME/.local/share/cargo/bin"
    "$GEM_HOME/bin"
    "$HOME/.local/share/gem/ruby/2.7.0/bin"
	"$path[@]"
)
export PATH

export EDITOR=vim

# Variables for XDG folder compatibility
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export _Z_DATA="$XDG_DATA_HOME/z"
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export LESSHISTFILE=-
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

# Dotbare https://github.com/kazhala/dotbare
export DOTBARE_DIR="$HOME/.dotfiles/.git"
export DOTBARE_TREE="$HOME/.dotfiles"

# KDE Global menu
GTK_MODULES=appmenu-gtk-module

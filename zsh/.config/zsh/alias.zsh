# Basic program replacement
alias ls='exa'
alias cat='bat'
alias vi='vim'
alias cloc='tokei'
alias make='make -B'

# Update
alias update='yay -Syu'

# Auto compile notes
alias notes='watchexec -w . -e rmd,yml -- pandoc -o notes.pdf metadata.yml notes.rmd'

# Set up external display that has lower DPI
alias ext-display='xrandr --output DP1 --right-of eDP1 --scale 2x2 && krestart && latte-restart'
# Set up wired mouse
alias set-mouse='xinput list | rg -o "Logitech Gaming Mouse G502[ ]+\tid=\d\d" | cut -d= -f2 | xargs -I% xinput set-button-map % 1 2 3 4 5 10 11 8 9 6 7 12 13 14 15 16 17 18 19 20'
alias home='set-mouse && ext-display'
# Send audio over HDMI
alias hdmi-audio='pacmd set-card-profile 0 output:hdmi-stereo'
alias normal-audio='pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo'
alias headphones="amixer -c 0 cset 'numid=10' 1 numid=10,iface=MIXER,name='Headphone Mic Boost Volume'; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0: values=1,1"

# Aliases for killing things
alias krestart='kstart5 plasmashell -- --replace'
alias latte-restart='kstart5 latte-dock -- --replace'

#alias feh='feh -. -Z --auto-rotate'

# Backup computer
alias backup='sudo rsync -aAXv --info=progress2 --info=stats1 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/veracrypt1","/lost+found","/home/*/.cache/*","/home/*/.local/share/Trash/*","/home/*/.thumbnails/*","/swapfile","/var/lib/systemd-swap/swapfc/*"} --delete / /run/media/isaac/isaac_backup/backup/'
alias backup-vps='rsync -aAXzz --info=progress2 --delete vps-root:/mnt/data/ /run/media/isaac/isaac_backup/server'

# Easy configuration aliases
alias zshconfig="vim $XDG_CONFIG_HOME/zsh/.zshrc"
alias aliasconfig="vim $XDG_CONFIG_HOME/zsh/alias.zsh"
alias envconfig="vim $XDG_CONFIG_HOME/zsh/env.zsh"
alias keyconfig="vim $XDG_CONFIG_HOME/zsh/keys.zsh"
alias funcconfig="vim $XDG_CONFIG_HOME/zsh/functions.zsh"
alias config-zsh="zshconfig"
alias config-alias="aliasconfig"
alias config-env="envconfig"
alias config-key="keyconfig"
alias config-func="funcconfig"

# Make wget follow XDG spec
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Separate raw photos into their own folder
alias moveraw="mkdir -p raw && mv *.ARW raw/"

# Install and remove packages with fzf
alias in="yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S"
alias ind="yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S --asdeps"
alias re="yay -Qq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns"
alias pkg="yay -Qi"

# copy into clipboard
alias copy="xclip -sel c"

# Super lazy ssh
alias vps="ssh vps"

# Using camera as webcam
# https://www.crackedthecode.co/how-to-use-your-dslr-as-a-webcam-in-linux/
alias webcam="sudo modprobe v4l2loopback && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2"

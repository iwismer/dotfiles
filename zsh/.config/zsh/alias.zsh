# Basic program replacement
alias ls='exa'
alias cat='bat -p'
alias vi='vim'
alias cloc='tokei'
# alias make='make -B'

# Update
alias update='paru -Pw; paru -Syu'

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
alias backup='sudo rsync -aAXvh --info=progress2 --info=stats1 --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/veracrypt1","/lost+found","/home/*/.cache/*","/home/*/.local/share/Trash/*","/home/*/.thumbnails/*","/swapfile","/swap/*","/var/lib/systemd-swap/swapfc/*"} --delete / /run/media/isaac/isaac_backup/backup/'
alias backup-vps='rsync -aAXzzh --info=progress2 --delete vps-root:/mnt/data/ /run/media/isaac/isaac_backup/server'
alias backup-photos='rclone sync /mnt/more-media/Pictures/ wasabi:iwismer-photos -P --exclude .thumbnails/ --exclude db/ --exclude .videoThumbnails/ --exclude "*.pptx" --exclude "Historic/Family 1916 - 1920 small Jpegs/" --exclude exif-info.db --delete-during --delete-excluded --fast-list'

# Easy configuration aliases
alias c-zsh="$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc"
alias c-alias="$EDITOR $XDG_CONFIG_HOME/zsh/alias.zsh"
alias c-env="$EDITOR $XDG_CONFIG_HOME/zsh/env.zsh"
alias c-key="$EDITOR $XDG_CONFIG_HOME/zsh/keys.zsh"
alias c-func="$EDITOR $XDG_CONFIG_HOME/zsh/functions.zsh"
alias c-fzf="$EDITOR $XDG_CONFIG_HOME/zsh/fzf.zsh"

# Make wget follow XDG spec
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Separate raw photos into their own folder
alias moveraw="mkdir -p raw && mv *.ARW raw/"

# Get package information
alias pkg="paru -Qi"

# copy into clipboard
alias copy="xclip -sel c"

# Super lazy ssh
alias vps="ssh vps"

# Using camera as webcam
# https://www.crackedthecode.co/how-to-use-your-dslr-as-a-webcam-in-linux/
alias webcam="sudo modprobe v4l2loopback card_label=\"VirtCam\" exclusive_caps=1 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2"
alias webcam2="sudo modprobe v4l2loopback card_label=\"VirtCam\" exclusive_caps=1 && gphoto2 --stdout --capture-movie | gst-launch-1.0 fdsrc ! decodebin3 name=dec ! queue ! videoconvert ! v4l2sink device=/dev/video2"

alias tb="nc termbin.com 9999"
alias tbc="tb | tee /dev/tty | copy"

alias fal="alias | rg"

alias wifiqr="nmcli device wifi show -s"


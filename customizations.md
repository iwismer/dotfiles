# Customizations

## Desktop

- Global theme: Breeze
- Plasma Style: Breeze Dark
- Application Style: Breeze
- Window decorations: Breeze
- Colours: Breeze
- Fonts:
  - General: Source Sans Pro 12pt light
  - Fixed Width: Hack Lig Nerd Font 11pt/Iosevka SS12 Extended 11pt
  - Small: 8pt regular
  - Toolbar: 11pt regular
  - Menu: 11pt light
  - Window Title: 11pt Bold
- Icons: Papirus `papirus-icon-theme`
- Emoticons: Emoji One `nodejs-emojione`
- Cursors: Breeze


### Application Windows

#### Global Menu

- Install `plasma5-applets-active-window-control`, `latte-dock`
- Ensure that the 'Application Menu' is part of the window controls
- Add the active window control widget to latte dock

#### KDE File Picker

Set the variable `GTK_USE_PORTAL=1`

## Touchpad

- Install `touchegg`
- Invert scroll direction

## Keyboard

### Shortcuts

- meta+x: KeepassXC
- meta+c: VSCode
- meta+v: Cantata
- meta+a: Yakuake
- meta+s: Slack
- meta+d: Dolphin
- meta+f: Firefox
- meta+t: Konsole
- meta+o: KOrganizer
- meta+e: kmail
- meta+shift+s: Signal
- meta+shift+c: KCalc
- ctrl+shift+esc: htop
- mata+l: Lock screen
- meta+shift+r: kstart5 plasmashell -- --replace
- meta+shift+q: sleep 1; xset dpms force off

## Pacman

- Copy files in `customizations/pacman/hooks/` to `/etc/pacman.d/hooks/`
- Copy `customizations/pacman/pacman.conf` to `/etc/pacman.conf`

## Startup

- Nextcloud
- Latte dock
- `yakuake`
- `signal-desktop --use-tray-icon --start-in-tray`
- `slack -u`

## Powertop

<https://wiki.archlinux.org/index.php/Powertop#Apply_settings>

## KWin Scripts

kwin-scripts-parachute

## zsh

Things that need to be installed:

- fzf
- dotbare
- git-delta (https://github.com/dandavison/delta)

## Touchegg

There is a systemd user service for it, but this is not triggered automatically. Instead it is launched as an autostart program when plasma launches. This is the only good way I could find to launch it, as I couldn't find a good way to launch it after the x session has started.

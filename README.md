# Dotfiles

Hey! You're checking out my personal dotfiles. Most of this interesting to you, but there are a few interesting things.

These are mainly for using Arch Linux with zsh and KDE Plasma.

- My ZSH RC files are in the zsh folder
  - They're split up into a few different files based on what they do
- `configuratins.md` has a list of some of the things I like for when I set up a new workstation
- Some of the configurations are just so that programs will use the XDG directories instead of configurations right in the home dir

## Using

I use GNU stow to store these, so use the following:

```
stow <dir>
```

Maybe I'll change over to something like gitbare at some point. Who knows!

## Notes

For ZSH to work, add `export ZDOTDIR=$HOME/.config/zsh` to `/etc/zsh/zshenv`

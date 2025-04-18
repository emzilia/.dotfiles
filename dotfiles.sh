#!/bin/bash
# Sets up symbolic links to all relevant dotfiles

mkdir -p "$HOME"/.bashrc.d

ln -sf "$HOME"/.dotfiles/.bashrc \
       "$HOME"/.bashrc

ln -sf "$HOME"/.dotfiles/.bashrc.d/bash_aliases \
       "$HOME"/.bashrc.d/bash_aliases

ln -sf "$HOME"/.dotfiles/.inputrc \
       "$HOME"/.inputrc

# Vim
ln -sf "$HOME"/.dotfiles/.vimrc \
       "$HOME"/.vimrc

ln -sf "$HOME"/.dotfiles/.writerc \
       "$HOME"/.writerc

ln -sf "$HOME"/.dotfiles/.azotebg \
       "$HOME"/.azotebg

ln -sf "$HOME"/.dotfiles/.emacs \
       "$HOME"/.emacs

# Wayland - Sway

mkdir -p "$HOME"/.config/sway
mkdir -p "$HOME"/.config/waybar
mkdir -p "$HOME"/.config/yofi
mkdir -p "$HOME"/.config/dunst
mkdir -p "$HOME"/.config/alacritty

ln -sf "$HOME"/.dotfiles/.config/sway/config \
       "$HOME"/.config/sway/config

ln -sf "$HOME"/.dotfiles/.config/yofi/yofi.config \
       "$HOME"/.config/yofi/yofi.config

ln -sf "$HOME"/.dotfiles/.config/waybar/config \
       "$HOME"/.config/waybar/config

ln -sf "$HOME"/.dotfiles/.config/waybar/style.css \
       "$HOME"/.config/waybar/style.css

ln -sf "$HOME"/.dotfiles/.config/dunst/dunstrc \
       "$HOME"/.config/dunst/dunstrc

ln -sf "$HOME"/.dotfiles/.config/alacritty/alacritty.toml \
       "$HOME"/.config/alacritty/alacritty.toml


# X11 - i3

mkdir -p "$HOME"/.config/i3
mkdir -p "$HOME"/.config/polybar
mkdir -p "$HOME"/.config/rofi

ln -sf "$HOME"/.dotfiles/.config/i3/config \
       "$HOME"/.config/i3/config

ln -sf "$HOME"/.dotfiles/.config/rofi/config.rasi \
       "$HOME"/.config/rofi/config.rasi

ln -sf "$HOME"/.dotfiles/.config/rofi/theme.rasi \
       "$HOME"/.config/rofi/theme.rasi

ln -sf "$HOME"/.dotfiles/.config/polybar/config.ini \
       "$HOME"/.config/polybar/config.ini

ln -sf "$HOME"/.dotfiles/.config/polybar/launch.sh \
       "$HOME"/.config/polybar/launch.sh


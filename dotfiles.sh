#!/bin/bash
# Sets up symbolic links to all relevant dotfiles

ln -s "$HOME"/.dotfiles/.bashrc \
      "$HOME"/.bashrc

mkdir "$HOME"/.bashrc.d

ln -s "$HOME"/.dotfiles/.bashrc.d/bash_aliases \
      "$HOME"/.bashrc.d/bash_aliases

ln -s "$HOME"/.dotfiles/.inputrc \
      "$HOME"/.inputrc

# Vim
ln -s "$HOME"/.dotfiles/.vimrc \
      "$HOME"/.vimrc

ln -s "$HOME"/.dotfiles/.writerc \
      "$HOME"/.writerc

# Wayland - Sway
ln -s "$HOME"/.dotfiles/.config/sway/config \
      "$HOME"/.config/sway/config

ln -s "$HOME"/.dotfiles/.config/yofi/yofi.config \
      "$HOME"/.config/yofi/yofi.config

ln -s "$HOME"/.dotfiles/.config/waybar/config \
      "$HOME"/.config/waybar/config

ln -s "$HOME"/.dotfiles/.config/waybar/style.css \
      "$HOME"/.config/waybar/style.css

# X11 - i3
ln -s "$HOME"/.dotfiles/.config/i3/config \
      "$HOME"/.config/i3/config

ln -s "$HOME"/.dotfiles/.config/rofi/config.rasi \
      "$HOME"/.config/rofi/config.rasi

ln -s "$HOME"/.dotfiles/.config/rofi/theme.rasi \
      "$HOME"/.config/rofi/theme.rasi

ln -s "$HOME"/.dotfiles/.config/polybar/config.ini \
      "$HOME"/.config/polybar/config.ini

ln -s "$HOME"/.dotfiles/.config/polybar/launch.sh \
      "$HOME"/.config/polybar/launch.sh



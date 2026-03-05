#!/bin/bash
# Установка dotfiles

# Stow для symlinks
sudo dnf install stow -y

stow hyprland
stow waybar
stow alacritty
stow nvim
stow tmux
stow zsh

echo "Dotfiles установлены! Перезайди в Hyprland."

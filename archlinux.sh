#!/bin/bash
sudo pacman -Syyu --noconfirm
sudo pacman -S --needed --noconfirm gdm alacritty nano zsh git timeshift switcheroo-control gnome-control-center fwupd nvidia-open gnome-backgrounds flatpak gnome-software noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation gnome-shell-extension-appindicator
flatpak update -y
flatpak install -y org.mozilla.firefox com.mattjakeman.ExtensionManager
sudo systemctl enable gdm bluetooth switcheroo-control

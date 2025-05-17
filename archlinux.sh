#!/bin/bash
sudo pacman -Syyu --noconfirm
sudo pacman -S --needed --noconfirm gdm gvfs-google gvfs-mtp ibus-typing-booster alacritty nano zsh git timeshift switcheroo-control gnome-control-center fwupd nvidia-open gnome-backgrounds flatpak gnome-software noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation gnome-shell-extension-appindicator
flatpak update -y
flatpak install -y org.mozilla.firefox com.mattjakeman.ExtensionManager
sudo systemctl enable gdm bluetooth switcheroo-control

sudo pacman -S --needed --noconfirm sbctl
sbctl status
sudo sbctl create-keys
sudo sbctl enroll-keys -m
sbctl status
sudo sbctl verify
sudo sbctl sign -s /boot/vmlinuz-linux
sudo sbctl sign -s /boot/EFI/Linux/arch-linux.efi
sudo sbctl sign -s /boot/EFI/Linux/arch-linux-fallback.efi
sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sudo bootctl install
sudo sbctl verify

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

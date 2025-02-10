#!/bin/bash
sudo pacman -S --needed --noconfirm sbctl

sbctl status
sudo sbctl create-keys
sudo sbctl enroll-keys -m
sbctl status

sudo sbctl verify
sudo sbctl sign -s /boot/vmlinuz-linux
sudo sbctl sign -s -o /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed /usr/lib/systemd/boot/efi/systemd-bootx64.efi
sudo bootctl install
sudo sbctl verify
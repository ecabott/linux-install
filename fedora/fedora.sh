#!/bin/bash
xargs sudo rm < unneeded-repos.txt
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
xargs sudo dnf remove -y < unneeded-packages.txt
sudo dnf autoremove -y
sudo dnf update -y
xargs sudo dnf install -y < packages.txt

flatpak remote-delete fedora
flatpak remote-delete fedora-testing
sudo flatpak remote-modify flathub --no-filter
xargs flatpak install -y < flatpaks.txt

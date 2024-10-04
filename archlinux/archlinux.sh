#!/bin/bash
sudo pacman -Syu
sudo pacman -S --needed - < packages.txt
xargs flatpak install < flatpaks.txt
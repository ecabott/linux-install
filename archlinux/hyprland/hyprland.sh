#!/bin/bash
sudo pacman -Syu
sudo pacman -S --needed - < packages.txt

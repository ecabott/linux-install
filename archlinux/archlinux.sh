#!/bin/bash
echo "Installing"
sudo pacman -S --needed --noconfirm - < packages.txt
xargs flatpak install -y < flatpaks.txt

PS3="Select option: "
select option in gnome hyprland
do
    case $option in
        "gnome")
            echo "Installing $option."
            sudo pacman -S --needed --noconfirm - < gnome/packages.txt
            xargs flatpak install -y < gnome/flatpaks.txt
            xargs sudo systemctl enable < gnome/services.txt
            break;;
        "hyprland")
            echo "Installing $option."
            sudo pacman -S --needed --noconfirm - < hyprland/packages.txt
            cp -r hyprland/dotfiles/.config ~
            break;;
        *)
            echo "Invalid selection, skipping"
            break;;
    esac
done

read -p "Do you want to install the nvidia drivers? y/n: " choice
case $choice in
[yY]* ) sudo pacman -S --needed --noconfirm - < nvidia.txt ;;
[nN]* ) echo "Skipped nvidia driver installation" ;;
*) echo "Invalid selection, skipping" ;;
esac

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo Done!
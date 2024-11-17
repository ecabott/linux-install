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
            echo "Installation of $option not yet implemented"
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

echo Done!

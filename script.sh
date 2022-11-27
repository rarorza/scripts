#!/usr/bin/env bash

set -e

packages=( awesome rofi picom alacritty xterm ranger htop git vim neovim vlc smplayer lutris steam wine winetricks xf86-input-wacom libwacom xorg-xinput lxappearance qt5ct neofetch nitrogen polkit-gnome ntfs-3g fuse bluez bluez-utils hplip flatpak gimp alsa-utils flameshot qbittorrent firefox piper)

packages_yay=( google-chrome winff qt5-styleplugins grub-customizer hplip-plugin )

packages_flatpak=( bitwarden discord snes9x pcsx2 rpcs3 citra duckstation ryujinx yuzu )

sudo pacman -Syu
sudo pacman -S ${packages[@]}
#pacman -S ${packages[@]} --noconfirm

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..
yay -S ${packages_yay[@]}

flatpak install ${packages_flatpak[@]}
#flatpak install ${packages_flatpak[@]} -y

git clone https://github.com/rarorza/awesome/
sudo cp -r awesome/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/.scripts/ /home/rarorza/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/alacritty/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/alacritty/.local/share/fonts/ /home/rarorza/.local/share/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/picom/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/ranger/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/rofi/themes/android_notification.rasi /usr/share/rofi/themes/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/themes\ awesomewm/Dark/ /usr/share/awesome/themes/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/.scripts/rofi-power-menu/rofi-power-menu /usr/bin/

fc-cache -vf

#continuar = https://plus.diolinux.com.br/t/tutorial-faca-seu-proprio-script-de-pos-instalacao/10021

#!/usr/bin/env bash

set -e

pacotes=( awesome rofi picom alacritty xterm ranger htop git vim neovim vlc smplayer lutris steam wine winetricks xf86-input-wacom libwacom xorg-xinput lxappearance qt5ct neofetch nitrogen polkit-gnome ntfs-3g fuse bluez bluez-utils hplip flatpak gimp alsa-utils flameshot qbittorrent firefox piper)

pacotes_yay=( google-chrome winff qt5-styleplugins grub-customizer hplip-plugin )

pacotes_flatpak=( bitwarden discord snes9x pcsx2 rpcs3 citra duckstation ryujinx yuzu )

git clone https://github.com/rarorza/awesome/
cp -r awesome/ /home/"$USER"/.config/
cp -r /home/"$USER"/.config/awesome/dotfiles/.scripts/ /home/"$USER"/
cp -r /home/"$USER"/.config/awesome/dotfiles/alacritty/ /home/"$USER"/.config/
cp -r /home/"$USER"/.config/awesome/dotfiles/picom/ /home/"$USER"/.config/
cp -r /home/"$USER"/.config/awesome/dotfiles/ranger/ /home/"$USER"/.config/
cp -r /home/"$USER"/.config/awesome/dotfiles/rofi/themes/android_notification.rasi /usr/share/rofi/themes/
cp -r /home/"$USER"/.config/awesome/dotfiles/themes\ awesomewm/Dark/ /usr/share/awesome/themes/
cp -r /home/"$USER"/.config/awesome/dotfiles/.scripts/rofi-power-menu/rofi-power-menu /usr/bin/

pacman -Syu
pacman -S ${pacotes[@]} --noconfirm

#continuar = https://plus.diolinux.com.br/t/tutorial-faca-seu-proprio-script-de-pos-instalacao/10021

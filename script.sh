#!/usr/bin/env bash

set -e

packages=( awesome rofi picom alacritty xterm ranger htop vim neovim vlc smplayer lutris wine winetricks xf86-input-wacom libwacom xorg-xinput lxappearance qt5ct neofetch nitrogen polkit-gnome ntfs-3g fuse bluez bluez-utils hplip flatpak gimp alsa-utils flameshot qbittorrent firefox piper calibre nodejs yarn npm rust )

packages_options=( steam )
#

packages_yay=( google-chrome winff qt5-styleplugins grub-customizer hplip-plugin zsh ttf-meslo-nerd-font-powerlevel10k powerline-fonts awesome-terminal-fonts zsh-theme-powerlevel10k-git )

packages_flatpak=( bitwarden snes9x pcsx2 rpcs3 citra duckstation ryujinx yuzu )

packages_options_flatpak=( discord )
#

sudo pacman -Syu
sudo pacman -S ${packages[@]} --noconfirm
sudo pacman -S ${packages_options[@]}

git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..
yay -S ${packages_yay[@]} --noconfirm
#

flatpak install ${packages_flatpak[@]} -y
#
flatpak install ${packages_options_flatpak[@]}

git clone https://github.com/rarorza/awesome/
sudo cp -r awesome/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/.scripts/ /home/rarorza/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/alacritty/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/alacritty/.local/share/fonts/ /home/rarorza/.local/share/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/picom/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/ranger/ /home/rarorza/.config/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/zsh/.zshrc /home/rarorza/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/rofi/themes/android_notification.rasi /usr/share/rofi/themes/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/themes\ awesomewm/Dark/ /usr/share/awesome/themes/
sudo cp -r /home/rarorza/.config/awesome/dotfiles/.scripts/rofi-power-menu/rofi-power-menu /usr/bin/
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' | sudo tee -a /etc/environment

fc-cache -vf

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
cargo install exa bat
chsh -s /usr/bin/zsh

#continuar = https://plus.diolinux.com.br/t/tutorial-faca-seu-proprio-script-de-pos-instalacao/10021

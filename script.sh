#!/usr/bin/env bash

set -e

# Pacman packages
packages=( awesome rofi picom alacritty xterm ranger bashtop feh vim neovim vlc smplayer nvidia-settings lutris wine winetricks xf86-input-wacom libwacom kcm-wacomtablet xorg-xinput lxappearance qt5ct neofetch nitrogen polkit-gnome ntfs-3g fuse bluez bluez-utils hplip skanlite flatpak gimp alsa-utils flameshot qbittorrent firefox piper calibre nodejs yarn npm rust gnome-boxes gparted os-prober pavucontrol lib32-pipewire unrar acpid xournalpp libreoffice-fresh xorg-xkill ueberzug gamemode lib32-gamemode noto-fonts-emoji )

# Pacman packages with specific options
packages_options=( steam base-devel )

# AUR packages
packages_yay=( google-chrome winff qt5-styleplugins grub-customizer hplip-plugin zsh ttf-meslo-nerd-font-powerlevel10k powerline-fonts awesome-terminal-fonts zsh-theme-powerlevel10k-git appimagelauncher visual-studio-code-bin rofi-power-menu )

# Flatpak packages
packages_flatpak=( com.bitwarden.desktop com.discordapp.Discord com.heroicgameslauncher.hgl com.obsproject.Studio com.snes9x.Snes9x io.mgba.mGBA net.pcsx2.PCSX2 net.rpcs3.RPCS3 org.DolphinEmu.dolphin-emu org.citra_emu.citra org.duckstation.DuckStation org.fedoraproject.MediaWriter org.gnome.Calculator org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.yuzu_emu.yuzu sh.ppy.osu )

# Install pacman packages
sudo pacman -Syu
sudo pacman -S ${packages[@]} --noconfirm
sudo pacman -S ${packages_options[@]}

# Install YAY
cd ..
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..
yes | rm -r yay/

# Install AUR packages
yay -S ${packages_yay[@]} --noconfirm

# Install flatpak packages
flatpak install ${packages_flatpak[@]} -y

# AwesomeWM and general config files
git clone https://github.com/rarorza/awesome/
cp -r awesome/ /$HOME/.config/
yes | rm -r awesome/
cp -r /$HOME/.config/awesome/dotfiles/.scripts/ /$HOME/
cp -r /$HOME/.config/awesome/dotfiles/alacritty/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/picom/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/ranger/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/zsh/.zshrc /$HOME/
cp -r /$HOME/.config/awesome/dotfiles/Xresources/.Xresources /$HOME/
sudo cp -r /$HOME/.config/awesome/dotfiles/rofi/themes/android_notification.rasi /usr/share/rofi/themes/
sudo cp -r /$HOME/.config/awesome/dotfiles/awesome/themes/Dark/ /usr/share/awesome/themes/
#sudo cp -r /$HOME/.config/awesome/dotfiles/.scripts/rofi-power-menu/rofi-power-menu /usr/bin/
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' | sudo tee -a /etc/environment

# Auto update/save DNS
sudo cp -r /$HOME/.config/awesome/dotfiles/resolv/resolv.conf.override /etc/
sudo cp -r /$HOME/.config/awesome/dotfiles/resolv/override.sh /etc/NetworkManager/dispatcher.d/
sudo chown root:root /etc/NetworkManager/dispatcher.d/override.sh
sudo chmod 755 /etc/NetworkManager/dispatcher.d/override.sh
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service

# Start and enable bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Install fonts
cp -r /$HOME/.config/awesome/dotfiles/alacritty/.local/share/fonts/ /$HOME/.local/share/
fc-cache -vf

# Install addons for ZSH
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
cargo install exa bat
chsh -s /usr/bin/zsh

#!/usr/bin/env bash

set -e

# Pacman packages
packages=( alacritty ranger htop smplayer lutris wine winetricks flatpak gimp flameshot qbittorrent piper calibre nodejs yarn npm rust gnome-boxes gparted lib32-pipewire unrar xournalpp )

# Pacman packages with specific options
packages_options=( steam base-devel )

# AUR packages
packages_yay=( google-chrome winff zsh ttf-meslo-nerd-font-powerlevel10k powerline-fonts awesome-terminal-fonts zsh-theme-powerlevel10k-git visual-studio-code-bin )

# Flatpak packages
packages_flatpak=( com.bitwarden.desktop com.discordapp.Discord com.heroicgameslauncher.hgl com.obsproject.Studio com.snes9x.Snes9x io.mgba.mGBA net.pcsx2.PCSX2 net.rpcs3.RPCS3 org.DolphinEmu.dolphin-emu org.citra_emu.citra org.duckstation.DuckStation org.fedoraproject.MediaWriter org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.yuzu_emu.yuzu sh.ppy.osu )

# Install pacman packages
sudo pacman -Syu
sudo pacman -S ${packages[@]} --noconfirm
sudo pacman -S ${packages_options[@]}

# Install YAY
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..

# Install AUR packages
yay -S ${packages_yay[@]}

# Install flatpak packages
flatpak install ${packages_flatpak[@]} -y

# General config files
git clone https://github.com/rarorza/awesome/
cp -r $HOME/script/awesome/dotfiles/alacritty/ /$HOME/.config/
cp -r $HOME/script/awesome/dotfiles/zsh/.zshrc /$HOME/

# Install fonts
cp -r $HOME/script/awesome/dotfiles/alacritty/.local/share/fonts/ /$HOME/.local/share/
fc-cache -vf

# Install addons for ZSH
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
cargo install exa bat
chsh -s /usr/bin/zsh

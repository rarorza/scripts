#!/usr/bin/env bash

set -e

# Pacman packages
packages=( awesome rofi picom alacritty ueberzug xterm ranger bashtop neofetch feh mupdf vim neovim nvidia-settings gamemode lib32-gamemode lutris wine winetricks xf86-input-wacom libwacom kcm-wacomtablet xorg-xinput lxappearance qt5ct nitrogen polkit-gnome ntfs-3g fuse bluez bluez-utils hplip skanlite flatpak alsa-utils pavucontrol lib32-pipewire flameshot firefox chromium piper calibre gnome-boxes gparted os-prober unrar acpid xournalpp libreoffice-fresh xorg-xkill noto-fonts-emoji nodejs yarn npm rust docker docker-compose python-pip gimp vlc smplayer breeze-gtk gufw kolourpaint transmission-qt adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-cn-fonts ark kcalc jdk-openjdk kdialog tor torbrowser-launcher nyx vulkan-tools mesa-demos lazarus )

# Pacman packages with specific options
packages_options=( steam base-devel dolphin )

# AUR packages
packages_yay=( google-chrome winff qt5-styleplugins grub-customizer hplip-plugin zsh ttf-meslo-nerd-font-powerlevel10k powerline-fonts awesome-terminal-fonts zsh-theme-powerlevel10k-git visual-studio-code-bin rofi-power-menu asdf-vm upscayl-bin clang-format-all-git ttf-ms-win10-auto minecraft-launcher selectdefaultapplication-git mangohud-git lib32-mangohud-git goverlay-git vkbasalt )

# Flatpak packages
packages_flatpak=( com.bitwarden.desktop com.discordapp.Discord com.heroicgameslauncher.hgl com.obsproject.Studio com.snes9x.Snes9x io.mgba.mGBA net.pcsx2.PCSX2 net.rpcs3.RPCS3 org.DolphinEmu.dolphin-emu org.citra_emu.citra org.duckstation.DuckStation org.fedoraproject.MediaWriter org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.yuzu_emu.yuzu sh.ppy.osu net.davidotek.pupgui2 org.telegram.desktop )

# Pip packages
packages_pip=( black flake8 bandit isort )

# Npm packages
packages_npm=( live-server prettier pyright )

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
flatpak install flathub ${packages_flatpak[@]} -y

# Install pip packages
pip install ${packages_pip[@]}

# Install npm packages
mkdir dev/
cd dev/
sudo npm install -g ${packages_npm[@]}
cd ..

# AwesomeWM and general config files
git clone git@github.com:rarorza/awesome.git
cp -r awesome/ /$HOME/.config/
yes | rm -r awesome/
cp -r /$HOME/.config/awesome/dotfiles/.scripts/ /$HOME/
cp -r /$HOME/.config/awesome/dotfiles/alacritty/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/picom/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/ranger/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/zsh/.zshrc /$HOME/
cp -r /$HOME/.config/awesome/dotfiles/Xresources/.Xresources /$HOME/
sudo cp -r /$HOME/.config/awesome/dotfiles/rofi/themes/dmenu.rasi /usr/share/rofi/themes/
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

# Enable firewall
sudo ufw default deny incoming
sudo ufw enable
sudo ufw reload

# Enable docker
sudo systemctl enable --now docker docker.socket containerd  

# Install Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config/}"/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install fonts
cp -r /$HOME/.config/awesome/dotfiles/alacritty/.local/share/fonts/ /$HOME/.local/share/
fc-cache -vf

# Install addons for ZSH
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
cargo install exa bat
chsh -s /usr/bin/zsh

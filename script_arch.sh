#!/usr/bin/env bash

set -e

# Pacman packages
packages=( 
    # ======== Tools ======== #
    firefox 
    chromium 
    tor 
    torbrowser-launcher 
    flameshot 
    piper 
    calibre 
    gnome-boxes 
    gparted 
    unrar 
    xournalpp 
    libreoffice-still 
    gimp 
    vlc 
    smplayer 
    qbittorrent 
    obs-studio 
    telegram-desktop 
    leafpad 
    yt-dlp # download videos youtube
    kolourpaint 
    nyx 
    # ======== BTRFS ======== #
    snapper
    snap-pac
    # ======== System / Hardware ======== #
    man-db 
    xf86-input-wacom 
    libwacom 
    kcm-wacomtablet 
    xf86-input-synaptics # touch pad, copy file in "cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/"
    xorg-xinput 
    xorg-xkill 
    blueman 
    bluez 
    bluez-utils 
    bluez-tools
    alsa-utils 
    pavucontrol 
    lib32-pipewire 
    ntfs-3g 
    hplip 
    acpid 
    linux-headers 
    flatpak 
    gufw 
    # ======== AMD ======== #
    vulkan-radeon
    libva-mesa-driver 
    vulkan-icd-loader 
    lib32-mesa 
    lib32-vulkan-radeon 
    lib32-vulkan-icd-loader 
    lib32-libva-mesa-driver 
    mesa-demos
    amd-ucode    
    vulkan-tools 
    # ======== NVDIA ======== #
    nvidia 
    nvidia-settings 
    # ======== GAMES ======== #
    steam 
    goverlay
    mangohud
    lib32-mangohud
    gamemode 
    lib32-gamemode 
    lutris 
    wine 
    winetricks 
    vkd3d 
    lib32-vkd3d 
    # ======== Dev ======== #
    base-devel 
    zsh 
    starship 
    xclip 
    dbeaver 
    nodejs 
    yarn 
    npm 
    pnpm
    rust
    cargo 
    go 
    jdk-openjdk 
    docker 
    docker-compose 
    python-pip 
    dotnet-runtime 
    dotnet-sdk 
    aspnet-runtime 
    pycharm-community-edition 
    alacritty 
    kitty 
    vim 
    neovim 
    fuse 
    sqlitebrowser 
    # ======== Astronvim ======== #
    fd
    ripgrep
    lazygit
    gdu
    bottom
    # ======== ASDF VM ======== #
    openssl 
    zlib 
    xz 
    tk
    # ======== KDE ======== #
    dolphin
    ffmpegthumbs
    kio-gdrive 
    ark
    kdialog 
    breeze-gtk 
    okular
    kcalc 
    gwenview
    skanlite
    spectacle # screenshot wayland
    # ======== XFCE / GNOME ======== #
    lightdm-gtk-greeter-settings
    ffmpegthumbnailer
    gnome-themes-extra # to apply dark theme in legacy apps
    gnome-keyring 
    polkit-gnome 
    xreader
    file-roller # unzip files gui
    # ======== Hyprland ======== #
    egl-wayland
    hyprpaper
    waybar
    nwg-look # lx substitute
    wl-clipboard
    # ======== TWM ======== #
    awesome 
    lxappearance 
    qt5ct
    qt6ct
    nitrogen 
    rofi 
    xterm 
    picom 
    ranger 
    pcmanfm # file manager
    gvfs # dependence file manager
    bashmount 
    htop 
    neofetch 
    feh 
    mupdf 
    peazip-qt-bin # ark alternative yay
    file-roller # gtk
    transh-cli 
    # ======== Fonts ======== #
    ttf-fira-code 
    ttf-hack-nerd 
    ttf-meslo-nerd 
    ttf-jetbrains-mono-nerd 
    adobe-source-han-sans-jp-fonts 
    adobe-source-han-sans-kr-fonts 
    adobe-source-han-sans-cn-fonts 
    noto-fonts-emoji
    ttf-liberation
    )

# AUR packages
packages_yay=( 
    # ======== Tools ======== #
    google-chrome
    winff 
    bashmount 
    ventoy-bin 
    # ======== Dev ======== #
    visual-studio-code-bin 
    # ======== System ======== #
    hplip-plugin 
    # ======== Games ======== #
    minecraft-launcher 
    vkbasalt # https://github.com/crosire/reshade-shaders
    # ======== TWM ======== #
    qt5-styleplugins 
    qt6gtk2
    selectdefaultapplication-git 
    rofi-power-menu 
    # ======== Hyprland ======== #
    tofi
    waypaper
    # ======== Fonts ======== #
    ttf-ms-fonts 
    powerline-fonts 
    awesome-terminal-fonts 
    # ======== BTRFS ======== #
    btrfs-assistant
    limine-snapper-sync
    limine-mkinitcpio-hook
    )

# Flatpak packages
packages_flatpak=(
    # ======== Tools ======== #
    com.bitwarden.desktop
    org.mozilla.firefox
    com.github.tchx84.Flatseal
    it.mijorus.gearlever
    com.discordapp.Discord
    org.telegram.desktop
    org.qbittorrent.qBittorrent
    org.libreoffice.LibreOffice
    com.rustdesk.RustDesk
    # ======== Games ======== #
    org.duckstation.DuckStation
    net.pcsx2.PCSX2
    org.ppsspp.PPSSPP
    org.citra_emu.citra 
    org.ryujinx.Ryujinx
    org.yuzu_emu.yuzu
    info.cemu.Cemu
    io.github.xyproto.zsnes
    org.libretro.RetroArch
    org.prismlauncher.PrismLauncher
    com.heroicgameslauncher.hgl
    net.lutris.Lutris
    net.davidotek.pupgui2
    com.github.Matoking.protontricks
    # ======== Art ======== #
    com.obsproject.Studio
    org.kde.kdenlive
    org.gimp.GIMP
    org.kde.krita
    org.inkscape.Inkscape
    org.upscayl.Upscayl
    io.github.tntwise.REAL-Video-Enhancer
    # ======== Dev ======== #
    io.dbeaver.DBeaverCommunity
    rest.insomnia.Insomnia
    io.podman_desktop.PodmanDesktop
    com.unity.UnityHub
    # ======== Study ======== #
    md.obsidian.Obsidian
    net.ankiweb.Anki
    com.github.xournalpp.xournalpp
    # ======== XFCE / GNOME ======== #
    org.gnome.Calculator 
    org.gnome.Evince  
    org.gnome.SimpleScan
    # ======== KDE ======== #
    org.kde.kcalc
    org.kde.gwenview
    org.kde.okular
    org.kde.skanpage 
    )

packages_cargo=( 
     # ======== Dev ======== #
    tree-sitter-cli
     # ======== Hyprland ======== #
    hyprsome # awesome wm workspaces in hyperland
    )

# Install pacman packages
sudo pacman -Syu
sudo pacman -S ${packages[@]}
#sudo pacman -S ${packages[@]} --noconfirm

# Install YAY
cd ..
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ..
yes | rm -r yay/

# Install AUR packages
# yay -S ${packages_yay[@]} --noconfirm
yay -S ${packages_yay[@]}

# Install flatpak packages
flatpak install flathub ${packages_flatpak[@]} -y

# Install cargo packages
cargo install ${packages_cargo[@]}

# AwesomeWM and general config files
git clone https://github.com/rarorza/window_manager.git
cd window_manager/
cp -r awesome/ /$HOME/.config/
cp -r i3/ /$HOME/.config/
cd ..
yes | rm -r awesome/
cp -r /$HOME/.config/awesome/dotfiles/.scripts/ /$HOME/
cp -r /$HOME/.config/awesome/dotfiles/alacritty/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/kitty/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/picom/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/ranger/ /$HOME/.config/
cp -r /$HOME/.config/awesome/dotfiles/zsh/.zshrc /$HOME/
cp -r /$HOME/.config/awesome/dotfiles/Xresources/.Xresources /$HOME/
sudo cp -r /$HOME/.config/awesome/dotfiles/rofi/themes/dmenu.rasi /usr/share/rofi/themes/
sudo cp -r /$HOME/.config/awesome/dotfiles/awesome/themes/Dark/ /usr/share/awesome/themes/
#sudo cp -r /$HOME/.config/awesome/dotfiles/.scripts/rofi-power-menu/rofi-power-menu /usr/bin/
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' | sudo tee -a /etc/environment

# Oh-my-zsh! -> https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh Autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Zsh Syntax Highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Starship - > https://starship.rs/

# Auto update/save DNS
sudo cp -r /$HOME/.config/awesome/dotfiles/resolv/resolv.conf.override /etc/
sudo cp -r /$HOME/.config/awesome/dotfiles/resolv/zoverride.sh /etc/NetworkManager/dispatcher.d/
sudo chown root:root /etc/NetworkManager/dispatcher.d/zoverride.sh
sudo chmod 755 /etc/NetworkManager/dispatcher.d/zoverride.sh
sudo systemctl enable NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service

# Start and enable bluetooth
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
# Uncomment AutoEnable=true /etc/bluetooth/main.conf

# Enable firewall
sudo ufw default deny incoming
sudo ufw enable
sudo ufw reload
sudo systemctl start ufw.service
sudo systemctl enable ufw.service 

# Enable docker
sudo systemctl enable --now docker docker.socket containerd  
sudo groupadd docker 
sudo usermod -aG docker $USER

# Install fonts
fc-cache -vf

# Install addons for ZSH
chsh -s /usr/bin/zsh

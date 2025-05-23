# nodejs lts

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# android
sudo apt install scrcpy

# increase shortcuts to change workspace in gnome shell
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Alt>1']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Alt><Shift>1']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Alt>2']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Alt><Shift>2']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Alt>3']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Alt><Shift>3']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Alt>4']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Alt><Shift>4']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Alt>5']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Alt><Shift>5']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Alt>6']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Alt><Shift>6']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Alt>7']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Alt><Shift>7']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Alt>8']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Alt><Shift>8']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Alt>9']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Alt><Shift>9']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Alt>0']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Alt><Shift>0']"

# Disable animations from gnome
gsettings set org.gnome.desktop.interface enable-animations false

# nvim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# Make a backup of your current nvim config (if exists)
mv ~/.config/nvim ~/.config/nvim.bak

# Clean neovim folders (Optional but recommended)
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# asdf + astronvim

fd-find
ripgrep
gdu
openssl
tk
xz-utils
https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu
https://github.com/ClementTsang/bottom?tab=readme-ov-file#debian--ubuntu

#!/bin/bash
set -e

echo "[RUN] \$ $PKG_MANAGER install"
sudo dnf install curl git bash flatpak i3 picom tmux neovim kitty
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --enable fedora-cisco-openh264 -y
sudo dnf install steam -y
echo "[DONE] \$ $PKG_MANAGER install"

read -p "Install flatpak packages: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	echo "[RUN] \$ flatpak install"
	# TODO: add flathub repo before installing
	flatpak install com.spotify.Client com.discordapp.Discord md.obsidian.Obsidian com.google.Chrome -y
	echo "[DONE] \$ flatpak install"
fi

# read -p "Install fonts with fnt: [y/n] " ANSWER
# if [[ $ANSWER == "y" ]]; then
# 	echo "[RUN] \$ fnt install"
# 	fnt update
# 	fnt install jost inter jetbrainsmono
# 	echo "[DONE] \$ fnt install"
# fi

# sets bash as the default shell if not bash
read -p "Change default shell to bash: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	echo "default shell is $0, changing it to bash"
	echo '[RUN] $ chsh -s bash'
	chsh -s $(which bash)
fi

read -p "Install betterlockscreen and i3lock-color: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then

	echo "[RUN] installing dependencies"
	sudo dnf install -y autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel xdpyinfo bc xset
 	
	echo "[RUN] installing i3lock-color"
	git clone https://github.com/Raymo111/i3lock-color.git /tmp/i3lock-color
	cd /tmp/i3lock-color
	if [[ -f install-i3lock-color.sh ]]; then
		./install-i3lock-color.sh
	fi
	cd -
	
 	echo "[RUN] installing betterlockscreen"
	wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user
fi

echo '[INFO] to install tmux plugins use: <prefix+I>' 
echo '[DONE]'

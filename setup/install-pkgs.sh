#!/bin/bash

set -e

PKGS="flatpak tmux neovim rofi redshift dolphin wezterm shotwell gparted htop"

read -p "Are you running fedora or debian? [f/d]" ANSWER
if [[ $ANSWER == "f" ]]; then
	echo "[RUN] \$ sudo dnf install ${PKGS} steam loupe "
	sudo dnf install ${PKGS}
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
	# sudo $PKG_MANAGER config-manager --enable fedora-cisco-openh264 -y
	sudo dnf install steam -y
elif [[ $ANSWER == "d" ]]; then
	echo "[RUN] \$ sudo apt install ${PKGS}"
	sudo apt install ${PKGS}
else
	echo "Please give a valid response option"
	exit 1
fi
echo "[DONE] \$ $PKG_MANAGER install"

read -p "Install flatpak packages: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	echo "[RUN] \$ flatpak install"
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak install -y com.spotify.Client com.discordapp.Discord md.obsidian.Obsidian com.google.Chrome
	echo "[DONE] \$ flatpak install"
fi

# sets bash as the default shell if not bash
read -p "Change default shell to bash: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	echo '[RUN] $ chsh -s bash'
	echo "default shell is $0, changing it to bash"
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

echo '[INFO] please run the following scripts:'
echo '	1. set-resolution.sh'
echo '	2. set-flatpak-links.sh'
echo '	3. set-links.sh'
echo '	4. set-capslock.sh'

# ./set-resolution.sh
# ./set-flatpak-links.sh
# ./set-links.sh
# ./set-capslock.sh

echo '[DONE]'
exit 0

#!/bin/bash

PKGS="tmux neovim redshift wezterm htop curl git"

echo '[EXEC] installing packages'

echo "[EXEC] \$ sudo dnf install ${PKGS}"
sudo dnf install ${PKGS}
echo "[DONE] \$ $PKG_MANAGER install"

read -p "Install flatpak packages: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	sudo dnf install -y flatpak
	echo "[EXEC] \$ flatpak install"
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak install -y com.spotify.Client com.discordapp.Discord md.obsidian.Obsidian com.google.Chrome
	echo "[DONE] \$ flatpak install"
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

echo '[DONE] installing packages'
exit 0

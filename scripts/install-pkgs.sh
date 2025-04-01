#!/bin/bash

log_info() {
	echo "INFO: $1"
}

log_info 'Install packages script.'
PKGS="tmux neovim redshift btop git fastfetch"

log_info " \$ sudo dnf install ${PKGS}"
sudo dnf install ${PKGS}
log_info " \$ $PKG_MANAGER install"

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

read -p "Install flatpak packages: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	sudo dnf install -y flatpak
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak install -y com.spotify.Client com.discordapp.Discord md.obsidian.Obsidian com.google.Chrome
fi

read -p "Install betterlockscreen and i3lock-color: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then

	log_info "Installing dependencies"
	sudo dnf install -y autoconf automake cairo-devel fontconfig gcc libev-devel libjpeg-turbo-devel libXinerama libxkbcommon-devel libxkbcommon-x11-devel libXrandr pam-devel pkgconf xcb-util-image-devel xcb-util-xrm-devel xdpyinfo bc xset
 	
	log_info "Installing i3lock-color"
	git clone https://github.com/Raymo111/i3lock-color.git /tmp/i3lock-color
	cd /tmp/i3lock-color
	if [[ -f install-i3lock-color.sh ]]; then
		./install-i3lock-color.sh
	fi
	cd -
	
 	log_info "Installing betterlockscreen"
	wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user
fi

log_info 'finished'
exit 0

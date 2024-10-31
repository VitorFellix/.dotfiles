#!/bin/bash
set -e

if [[ $(whoami) != root ]]; then
	echo 'this script must be run with root privileges'
	exit 1
fi

# TODO: test this on fedora
if [[ -f /etc/os-release ]]; then
	. /etc/os-release
	OS=$ID
fi

if [[ $OS == 'debian' ]]; then
	PKG_MANAGER='apt'
elif [[ $OS == 'fedora' ]]; then
	PKG_MANAGER='yum'
fi

echo 'installing packages'

echo "[RUN] \$ $PKG_MANAGER install"
$PKG_MANAGER install curl git bash flatpak fnt i3 picom tmux neovim
echo "[DONE] \$ $PKG_MANAGER install"

read -p "Install flatpak packages: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	echo "[RUN] \$ flatpak install"
	flatpak install com.spotify.Client com.discordapp.Discord md.obsidian.Obsidian com.google.Chrome -y
	echo "[DONE] \$ flatpak install"
fi

read -p "Install fonts with fnt: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	echo "[RUN] \$ fnt install"
	fnt update
	fnt install jost inter jetbrainsmono
	echo "[DONE] \$ fnt install"
fi

# sets bash as the default shell if not bash
if [[ $(echo $0) != bash ]]; then
	echo "default shell is not bash, changing it to bash"
	echo '[RUN] $ chsh -s bash'
	chsh -s $(which bash)
fi

echo 'linking config from .dotfiles to system .config'
echo '[WARN] watch out! this script will remove your .config files'
read -p "Want to continue and link files: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	rm ~/.bashrc
	ln -s ~/.dotfiles/config/bashrc.config ~/.bashrc
	echo 'added link for .bashrc'

	# checks if dir does not exists
	if [[ ! -d ~/.tmux/plugins/tpm ]]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
	rm ~/.tmux.conf
	ln -s ~/.dotfiles/config/tmux.config ~/.tmux.conf
	echo 'added link for tmux'
	
	rm -rf ~/.config/i3/config
	mkdir ~/.config/i3
	ln -s ~/.dotfiles/config/i3.config ~/.config/i3/config
	echo 'added link for i3'
	
	rm -rf ~/.config/i3status/config
	mkdir ~/.config/i3status
	ln -s ~/.dotfiles/config/i3status.config ~/.config/i3status/config
	echo 'added link for i3status'
	
	rm -rf ~/.config/picom/config
	mkdir ~/.config/picom
	ln -s ~/.dotfiles/config/picom.config ~/.config/picom/config
	echo 'added link for picom'
	
	rm -rf ~/.config/nvim
	ln -s ~/.dotfiles/nvim ~/.config/nvim
	echo 'added link for nvim'
	
	rm -rf ~/.config/kitty
	mkdir ~/.config/kitty
	ln -s ~/.dotfiles/config/kitty.config ~/.config/kitty/kitty.conf
	ln -s ~/.dotfiles/config/kitty-launch.config ~/.config/kitty/kitty-launch.config
	echo 'added links for kitty'
fi

read -p "Want to install betterlockscreen and i3lock-color: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
 	echo "[RUN] installing betterlockscreen"
	wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user
 	
	echo "[RUN] installing i3lock-color"
	git clone https://github.com/Raymo111/i3lock-color.git /tmp/i3lock-color
	cd /tmp/i3lock-color
	if [[ -f install-i3lock-color.sh ]]; then
		./install-i3lock-color.sh
	fi
	cd -
fi

echo '[INFO] to install tmux plugins use: <prefix+I>' 
echo '[DONE]'

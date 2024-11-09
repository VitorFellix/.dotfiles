#!/bin/bash

set -e

echo 'linking config from .dotfiles to system .config'
echo '[WARN] watch out! this script will remove your .config files'
read -p "Want to continue and link files: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	rm -rf ~/.bashrc
	ln -s ~/.dotfiles/config/bashrc.config ~/.bashrc
	echo 'added link for .bashrc'

	# checks if dir does not exists
	if [[ ! -d ~/.tmux/plugins/tpm ]]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
	rm -rf ~/.tmux.conf
	ln -s ~/.dotfiles/config/tmux.config ~/.tmux.conf
	echo 'added link for tmux'
	
	rm -rf ~/.config/i3
	mkdir ~/.config/i3
	ln -s ~/.dotfiles/config/i3.config ~/.config/i3/config
	echo 'added link for i3'
	
	rm -rf ~/.config/i3status
	mkdir ~/.config/i3status
	ln -s ~/.dotfiles/config/i3status.config ~/.config/i3status/config
	echo 'added link for i3status'
	
	rm -rf ~/.config/picom
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

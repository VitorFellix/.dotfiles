#!/bin/bash

set -e

echo 'linking config from .dotfiles to system .config'
echo '[WARN] watch out! this script will remove your .config files'
read -p "bashrc link: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	rm -rf ~/.bashrc
	ln -s ~/.dotfiles/config/bashrc ~/.bashrc
	echo 'added link for .bashrc'
fi

read -p "tmux link: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	# checks if dir does not exists
	if [[ ! -d ~/.tmux/plugins/tpm ]]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
	rm -rf ~/.tmux.conf
	ln -s ~/.dotfiles/config/tmux.config ~/.tmux.conf
	echo 'added link for tmux'
fi
	
read -p "i3 and picom link: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	rm -rf ~/.config/i3
	mkdir -p ~/.config/i3
	ln -s ~/.dotfiles/config/i3.config ~/.config/i3/config
	echo 'added link for i3'
	
	rm -rf ~/.config/i3status
	mkdir -p ~/.config/i3status
	ln -s ~/.dotfiles/config/i3status.config ~/.config/i3status/config
	echo 'added link for i3status'
	
	rm -rf ~/.config/picom
	mkdir -p ~/.config/picom
	ln -s ~/.dotfiles/config/picom.config ~/.config/picom/config
	echo 'added link for picom'
fi
	
read -p "neovim link: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	rm -rf ~/.config/nvim
	ln -s ~/.dotfiles/nvim ~/.config/nvim
	echo 'added link for nvim'
fi

read -p "wezterm link: [y/n] " ANSWER
if [[ $ANSWER == "y" ]]; then
	rm -rf ~/.config/wezterm
	mkdir -p ~/.config/wezterm
	ln -s ~/.dotfiles/config/wezterm.lua ~/.config/wezterm/wezterm.lua
	echo 'added links for wezterm'
fi

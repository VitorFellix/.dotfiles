#!/bin/bash

log_info() {
	echo "INFO: $1"
}

log_warn() {
	echo "WARN: $1"
}

log_info 'Set links script.'

# $1 is link name
# $2 is path to .config
# $3 is path to config inside .dotfile/config
createLink() {
	local hook=$4

	log_info "Should link configuration for $1"
	read -p "[y/n] " ANSWER
	if [[ $ANSWER == "y" ]]; then
		eval "rm -rf $2"
		eval $hook
		eval "ln -s $3 $2"
		log_info "Configuration for $1 finished." 
	fi
}

createLink "bashrc" "~/.bashrc" "~/.dotfiles/config/bashrc"

createLink "tmux" "~/.tmux.conf" "~/.dotfiles/config/tmux.config"
createLink "neovim" "~/.config/nvim" "~/.dotfiles/nvim"
createLink "fastfetch" "~/.config/fastfetch/config.jsonc" "~/.dotfiles/config/fastfetch.jsonc"

log_warn 'desktop specific configurations'

createLink "wezterm" "~/.config/wezterm/wezterm.lua" "~/.dotfiles/config/wezterm.lua" 'mkdir -p ~/.config/wezterm'
createLink "waybar" "~/.config/waybar/config.jsonc" "~/.dotfiles/config/waybar.jsonc"
createLink "waybar style" "~/.config/waybar/style.css" "~/.dotfiles/config/waybar-style.css"
createLink "i3" "~/.config/i3/config" "~/.dotfiles/config/i3.config" 'mkdir -p ~/.config/i3'
createLink "i3status" "~/.config/i3status/config" "~/.dotfiles/config/i3status.config" 'mkdir -p ~/.config/i3status'
createLink "picom" "~/.config/picom/config" "~/.dotfiles/config/picom.config" 'mkdir -p ~/.config/picom'
createLink "rofi" "~/.config/rofi/config.rasi" "~/.dotfiles/config/rofi.css" 'mkdir -p ~/.config/rofi'
createLink "polybar" "~/.config/polybar/config.ini" "~/.dotfiles/config/polybar.ini" 'mkdir -p ~/.config/polybar'

log_info 'finished'
exit 0

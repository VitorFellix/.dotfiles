#!/bin/bash
# This script creates a link for each config from the .dotfiles folder to .config

createLink() {
	# $1 link name
	local LINK_NAME=$1
	# $2 path to .config
	local CONFIG=$2
	# $3 path to config inside .dotfile/config
	local DOTFILE=$3
	# $4 hook string, can be used to run other commands before creating the link
	local HOOK=$4

	log "creating backup for $CONFIG..."
	if [[ -d $CONFIG ]] || [[ -f $CONFIG ]]; then
		eval "cp -r $CONFIG $CONFIG.bak"
	fi

	eval "rm -rf $CONFIG"
	log "configuring $LINK_NAME..."
	eval $HOOK
	cmd="ln -s $DOTFILE $CONFIG"
	log "$cmd"
	eval "$cmd"
}

log '--- default x11 and bashrc configs'
createLink "bashrc" "~/.bashrc" "~/.dotfiles/config/bashrc"
# createLink ".xprofile" "~/.xprofile" "~/.dotfiles/config/xprofile"
# createLink ".xsession" "~/.xsession" "~/.dotfiles/config/xsession"

log '--- default apps configs'
# createLink "tmux" "~/.tmux.conf" "~/.dotfiles/config/tmux.config"
createLink "neovim" "~/.config/nvim" "~/.dotfiles/nvim"
createLink "fastfetch" "~/.config/fastfetch/config.jsonc" "~/.dotfiles/config/fastfetch.jsonc" 'mkdir -p ~/.config/fastfetch'
createLink "alacritty" "~/.config/alacritty/alacritty.toml" "~/.dotfiles/config/alacritty.toml" 'mkdir -p ~/.config/alacritty'
# createLink "wezterm" "~/.config/wezterm/wezterm.lua" "~/.dotfiles/config/wezterm.lua" 'mkdir -p ~/.config/wezterm'

log '--- desktop configs'
createLink "waybar" "~/.config/waybar/config.jsonc" "~/.dotfiles/config/waybar.jsonc" 'mkdir -p ~/.config/waybar'
createLink "waybar style" "~/.config/waybar/style.css" "~/.dotfiles/config/waybar-style.css"

createLink "hyprland" "~/.config/hypr/hyprland.conf" "~/.dotfiles/config/hypr/hyprland.conf" 'mkdir -p ~/.config/hypr'
createLink "hyprland-apps" "~/.config/hypr/apps.conf" "~/.dotfiles/config/hypr/apps.conf" 'mkdir -p ~/.config/hypr'
createLink "hyprland-envs" "~/.config/hypr/envs.conf" "~/.dotfiles/config/hypr/envs.conf" 'mkdir -p ~/.config/hypr'
createLink "hyprland-keybinds" "~/.config/hypr/keybinds.conf" "~/.dotfiles/config/hypr/keybinds.conf" 'mkdir -p ~/.config/hypr'
createLink "hyprland-monitors" "~/.config/hypr/monitors.conf" "~/.dotfiles/config/hypr/monitors.conf" 'mkdir -p ~/.config/hypr'
createLink "hyprland-startup" "~/.config/hypr/startup.conf" "~/.dotfiles/config/hypr/startup.conf" 'mkdir -p ~/.config/hypr'

# createLink "i3status" "~/.config/i3status/config" "~/.dotfiles/config/i3status.config" 'mkdir -p ~/.config/i3status'
# createLink "i3" "~/.config/i3/config" "~/.dotfiles/config/i3.config" 'mkdir -p ~/.config/i3'
# createLink "picom" "~/.config/picom/picom.conf" "~/.dotfiles/config/picom.conf" 'mkdir -p ~/.config/picom'
# createLink "rofi" "~/.config/rofi/config.rasi" "~/.dotfiles/config/rofi.css" 'mkdir -p ~/.config/rofi'
# createLink "polybar" "~/.config/polybar/config.ini" "~/.dotfiles/config/polybar.ini" 'mkdir -p ~/.config/polybar'

# log '--- services configs'
# createLink "ssh-agent" "~/.config/systemd/user/ssh-agent.service" "~/.dotfiles/config/services/ssh-agent.service" 'mkdir -p ~/.config/systemd/user/'
# systemctl --user enable --now ssh-agent.service

log '--- finished'

exit 0

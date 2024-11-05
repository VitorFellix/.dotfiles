#!/bin/bash

set -e

declare -A apps;
apps[discord]='/var/lib/flatpak/app/com.discordapp.Discord/current/active/export/bin/com.discordapp.Discord'
apps[obsidian]='/var/lib/flatpak/app/md.obsidian.Obsidian/current/active/export/bin/md.obsidian.Obsidian'
apps[teams]='/var/lib/flatpak/app/com.github.IsmaelMartinez.teams_for_linux/current/active/export/bin/com.github.IsmaelMartinez.teams_for_linux'
apps[spotify]='/var/lib/flatpak/app/com.spotify.Client/current/active/export/bin/com.spotify.Client'

# echo "${apps[@]}"		# shows values
# echo "${!apps[@]}"	# shows keys

for app in "${!apps[@]}"
do
	# checks if the value is a valid path to an app
	if [[ -f "${apps[$app]}" ]]; then
		echo "[$app]"
		path="$HOME/.local/bin/$app"
		
		if [[ -f "$path" ]]; then
			echo "link already exists at $path"
			ls -tralh "$path"
		else
			echo "no link found at $path"
			sudo ln -s ${apps[$app]} $path
			echo "link to $path created"
		fi
	else
		echo "could not find app: $app at ${apps[$app]}"
	fi
done


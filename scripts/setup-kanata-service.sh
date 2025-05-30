#!/bin/bash

# Stop if any error
set -e


if [[ ! -e $(which kanata) ]]; then
	log "kanata not installed. please run install-kanata script"
	exit 1
fi
log "kanata is installed"

# Configures the service by linking the configs and removing old ones
config(){
	log "installing service"
	KANATA_SERVICE_LOCAL="$HOME/.dotfiles/config/services/kanata.service"
	KANATA_SERVICE_SERVICE="$HOME/.config/systemd/user/kanata.service"
	rm -i $KANATA_SERVICE_SERVICE
	install -m 644 $KANATA_SERVICE_LOCAL $KANATA_SERVICE_SERVICE 
}

# Starts and prints the status of the service
start(){
	systemctl start --user kanata
	systemctl status --user kanata
}

# Enables the service
enable(){
	systemctl daemon-reload
	systemctl enable --user kanata
}

# Adds the user to input group
inputGroup(){
	sudo usermod -a -G input vitor
}

log "configuring service"
config

log "configuring user group"
inputGroup

log "enabling service"
enable

log "starting service"
start


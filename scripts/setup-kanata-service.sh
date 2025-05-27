#!/bin/bash

# Stop if any error
set -e

# Source log
source "/home/vitor/.dotfiles/bin/log"

# Configures the service by linking the configs and removing old ones
config(){
	if [[ ! -d "/etc/kanata" ]]; then
		log "creating directory for the service"
		mkdir /etc/kanata 
	fi
	log "ok directory exists"

	if [[ -e "/etc/kanata/kanata.kbd" ]]; then
		log "removing existing config"
		rm "/etc/kanata/kanata.kbd"
	fi
	log "creating link for config"
	ln -s "/home/vitor/.dotfiles/config/kanata.kbd" "/etc/kanata/kanata.kbd"

	if [[ -e "/usr/bin/kanata" ]]; then
		log "removing existing kanata"
		rm "/usr/bin/kanata"
	fi
	log "creating link to kanata"
	ln -s "/home/vitor/.cargo/bin/kanata" "/usr/bin/kanata"

	if [[ -e "/lib/systemd/system/kanata.service" ]]; then
		log "removing existing service"
		rm "/lib/systemd/system/kanata.service"
	fi

	log "installing service"
	install -m 644 "/home/vitor/.dotfiles/config/kanata.service" "/lib/systemd/system/kanata.service"
}

# Starts and prints the status of the service
start(){
	systemctl start kanata
	systemctl status kanata
}

# Enables the service
enable(){
	systemctl daemon-reload
	systemctl enable kanata
}

log "configuring service"
config

log "enabling service"
enable

log "starting service"
start


#!/bin/bash

ssh_dir=${HOME}/.ssh

if [ ! -d ${ssh_dir} ]; then
	log "${ssh_dir} doesnt exists"
	exit 1
fi
chmod 700 ~/.ssh

if [ -d "${ssh_dir}/config" ]; then
	log "changing ${ssh_dir}/config permissions"
	chmod 600 "${ssh_dir}/config"
fi

log "looking for keys on ${ssh_dir}"
keys=$(find ${ssh_dir} -type f | grep -v "pub\|old\|known\|host\|authorized_keys\|config")

for k in ${keys}; do
	log "adding key ${k}"
	chmod 600 "${k}"
	chmod 644 "${k}.pub"
	ssh-add ${k}
done

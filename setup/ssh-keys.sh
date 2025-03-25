#!/bin/bash

ssh_dir=${HOME}/.ssh

if [ ! -d ${ssh_dir} ]; then
	echo "${ssh_dir} doesnt exists"
	exit 1
fi

keys=$(find ${ssh_dir} -type f | grep -v "pub\|old\|known\|host")

for k in ${keys}; do
	ssh-add ${k}
done

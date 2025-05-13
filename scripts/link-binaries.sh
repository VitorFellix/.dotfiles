#!/bin/bash

echo 'adding these binaries to ~/.local/bin'
ls -A --color ~/.dotfiles/bin

for bin in ~/.dotfiles/bin/*; do
	bin_basename=$(basename $bin)
	if test -e ~/.local/bin/$bin_basename; then
		echo "already exists $bin_basename in ~/.local/bin"
		rm ~/.local/bin/$bin_basename
	fi
	if ! test -e ~/.local/bin/$bin_basename; then
		echo "creating link for $bin_basename"
		ln -s ~/.dotfiles/bin/$bin_basename ~/.local/bin/
	fi
done

#!/bin/bash

echo 'installing packages'
yum install tmux kitty curl git i3

# sets bash as the default shell 
chsh -s $(which bash)

# TODO: check if path already exists before cloning
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim
echo 'added link for ~/.config/nvim'

rm ~/.tmux.conf
ln -s ~/.dotfiles/config/.tmux.conf ~/.tmux.conf
echo 'added link for ~/.tmux.conf'

# rm ~/.config/terminator/config
# ln -s ~/.dotfiles/config/terminator ~/.config/terminator/config
# echo 'added link for ~/.config/terminator/config'

echo 'to install tmux plugins use: <C-b> I' 
echo 'finished'

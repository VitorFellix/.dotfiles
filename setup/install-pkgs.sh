#!/bin/bash

echo 'installing packages'
# yum install tmux i3 neovim curl git

# sets bash as the default shell 
chsh -s $(which bash)

# TODO: check if path already exists before cloning
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo '[WARN] watch out! this script will remove your .bashrc file'
rm ~/.bashrc
ln -s ~/.dotfiles/config/bashrc.config ~/.bashrc
echo 'added link for bash'

rm ~/.tmux.conf
ln -s ~/.dotfiles/config/tmux.config ~/.tmux.conf
echo 'added link for tmux'

rm -rf ~/.config/i3/config
ln -s ~/.dotfiles/config/i3.config ~/.config/i3/config
echo 'added link for i3'

rm -rf ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim
echo 'added link for nvim'

rm -rf ~/.config/kitty
mkdir ~/.config/kitty
ln -s ~/.dotfiles/config/kitty.config ~/.config/kitty/kitty.config
echo 'added link for kitty'

# rm ~/.config/terminator/config
# ln -s ~/.dotfiles/config/terminator ~/.config/terminator/config
# echo 'added link for ~/.config/terminator/config'

echo 'to install tmux plugins use: <C-b> I' 
echo 'finished'

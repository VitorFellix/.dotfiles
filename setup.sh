#!/bin/bash

echo 'installing dependencies'
sudo apt install nala
sudo nala install zsh tmux neovim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # install ohmyzsh
chsh -s $(which zsh) # sets zsh as the default shell

rm -rf ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim
echo 'added link for ~/.config/nvim'

rm -rf ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
echo 'added link for ~/.zshrc'

rm -rf ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
echo 'added link for ~/.tmux.conf'

echo 'finished'

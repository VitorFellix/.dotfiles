#!/bin/bash

echo 'installing dependencies'
sudo apt install zsh tmux git curl terminator
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # install ohmyzsh
chsh -s $(which zsh) # sets zsh as the default shell

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim
echo 'added link for ~/.config/nvim'

rm ~/.zshrc
ln -s ~/.dotfiles/config/.zshrc ~/.zshrc
echo 'added link for ~/.zshrc'

rm ~/.tmux.conf
ln -s ~/.dotfiles/config/.tmux.conf ~/.tmux.conf
echo 'added link for ~/.tmux.conf'

rm ~/.config/terminator/config
ln -s ~/.dotfiles/config/terminator ~/.config/terminator/config
echo 'added link for ~/.config/terminator/config'

echo 'install plugins inside tmux with: <C-b> I' 
echo 'finished'

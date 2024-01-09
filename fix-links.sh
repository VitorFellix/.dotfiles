#!/bin/bash

rm -rf ~/.config/nvim
ln -s ${PWD}/nvim ~/.config/nvim
echo 'added link to ~/.config/nvim'

rm -rf ~/.zshrc
ln -s ${PWD}/.zshrc ~/.zshrc
echo 'added link to ~/.zshrc'

echo 'finished'

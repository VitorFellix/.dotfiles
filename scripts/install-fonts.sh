#!/bin/bash

FONTS_PATH="~/.local/share/"
INSTALL_CMD="cp -r $SCRIPTS_PATH/../fonts $FONTS_PATH"
echo 'copying fonts files...'
echo $INSTALL_CMD
eval $INSTALL_CMD

echo 'caching fonts...'
fc-cache -f
echo 'done'

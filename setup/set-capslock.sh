#!/bin/bash
set -e

echo 'setting capslock as Hyper L'

FILE=~/.Xmodmap

echo 'clear lock
clear mod3
clear mod4
keycode 66 = Hyper_L NoSymbol Hyper_L
add mod3 = Hyper_L
add mod4 = Super_R' > $FILE

chmod +x $FILE

echo "file $FILE content"
cat $FILE

echo 'done'

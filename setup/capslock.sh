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

xmodmap $FILE

echo 'done'


# ! #### ORIGINAL MOD MAP - DO NOT CHANGE IN CASE RESETTING IS NEEDED ####
# ! keycode  66 = Caps_Lock NoSymbol Caps_Lock
# ! shift       Shift_L (0x32),  Shift_R (0x3e)
# ! lock        Caps_Lock (0x42)
# ! control     Control_L (0x25),  Control_R (0x69)
# ! mod1        Alt_L (0x40),  Alt_R (0x6c),  Meta_L (0xcd)
# ! mod2        Num_Lock (0x4d)
# ! mod3
# ! mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
# ! mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)

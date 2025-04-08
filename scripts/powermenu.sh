echo -e " Power Off\n Reboot\n󰍃 Logout" | wofi --dmenu | while read -r option; do
  case $option in
    " Power Off") poweroff ;;
    " Reboot") reboot ;;
    "󰍃 Logout") hyprctl dispatch exit ;;
  esac
done

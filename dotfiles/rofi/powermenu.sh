#/bin/sh
selection=$(printf "Logout\nRestart\nShutdown" | rofi -dmenu -i -theme-str '@import ".config/rofi/power.rasi"')

case "$selection" in
  "Logout") hyprctl dispatch exit ;;
  "Restart") reboot ;;
  "Shutdown") shutdown now;;
  *) exit 1 ;;
esac

#/bin/sh
selection=$(printf "Lock\nLogout\nRestart\nShutdown" | rofi -dmenu -i -theme-str '@import ".config/rofi/power.rasi"')

case "$selection" in
  "Lock") hyprlock ;;
  "Logout") hyprctl dispatch exit ;;
  "Restart") reboot ;;
  "Shutdown") shutdown now;;
  *) exit 1 ;;
esac

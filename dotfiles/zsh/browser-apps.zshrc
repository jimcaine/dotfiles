#!/usr/bin/env zsh

# get system browser
BROWSER=$(xdg-settings get default-web-browser | sed 's/\.desktop//')
echo "Using browser ${BROWSER}."

if [[ "$BROWSER" == "chromium" || "$BROWSER" == "google-chrome" || "$BROWSER" == "brave" ]]; then
    # Chromium-based browsers support --app
    alias espn="$BROWSER --app=https://www.espn.com"
    alias trello="$BROWSER --app=https://trello.com"
    alias gpt="$BROWSER --app=https://chatgpt.com"
    alias tv="$BROWSER --app=https://tv.youtube.com"
    alias youtube="$BROWSER --app=https://www.youtube.com"

elif [[ "$BROWSER" == "firefox" || "$BROWSER" == "librewolf" ]]; then
    # Firefox/LibreWolf prefer --new-window
    alias espn="$BROWSER --new-window https://www.espn.com"
    alias trello="$BROWSER --new-window https://trello.com"
    alias gpt="$BROWSER --new-window https://chatgpt.com"
    alias tv="$BROWSER --new-window https://tv.youtube.com"
    alias youtube="$BROWSER --new-window https://www.youtube.com"

else
    # Default fallback
    alias espn="$BROWSER https://www.espn.com"
    alias trello="$BROWSER https://trello.com"
    alias gpt="$BROWSER https://chatgpt.com"
    alias tv="$BROWSER https://tv.youtube.com"
    alias youtube="$BROWSER https://www.youtube.com"
fi

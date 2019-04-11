#!/usr/bin/env bash

# Homebaked Slack Dark Mode. After executing this script, hit refresh (⌘ + R) or restart Slack for changes to take effect.
# Adopted from https://gist.github.com/a7madgamal/c2ce04dde8520f426005e5ed28da8608

SLACK_RESOURCES_DIR="/Applications/Slack.app/Contents/Resources"
SLACK_FILEPATH="$SLACK_RESOURCES_DIR/app.asar.unpacked/src/static/ssb-interop.js"
THEME_FILEPATH="$SLACK_RESOURCES_DIR/dark-theme.css"

#curl -sSL -o "$THEME_FILEPATH" "https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css"

OWNER=$(stat -f "%Su" /Applications/Slack.app)
if [[ $OWNER == root ]]; then 
  sudo cp -af dark-theme.css "$THEME_FILEPATH"
  echo "Add Dark Theme to Slack... " 
  cat event-listener.js | sudo tee -a "$SLACK_FILEPATH"
else 
  cp -af dark-theme.css "$THEME_FILEPATH"
  echo "Add Dark Theme to Slack... " 
  cat event-listener.js >> "$SLACK_FILEPATH"
fi

echo "Done! After executing this script, hit refresh (⌘ + R) or restart Slack for changes to take effect."

#!/usr/bin/env bash
# Usage: ./slack-dark-mode.sh (see README.md for other commands)
# Homebaked Slack Dark Mode. After executing this script restart Slack for changes to take effect.
# Adopted from https://gist.github.com/a7madgamal/c2ce04dde8520f426005e5ed28da8608

SLACK_DIRECT_LOCAL_SETTINGS="Library/Application\ Support/Slack/local-settings.json"
SLACK_STORE_LOCAL_SETTINGS="Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application\ Support/Slack/local-settings.json"
OSX_SLACK_RESOURCES_DIR="/Applications/Slack.app/Contents/Resources"
LINUX_SLACK_RESOURCES_DIR="/usr/lib/slack/resources"
UPDATE_ONLY="false"

for arg in "$@"; do
    shift
    case "$arg" in
        -[uU]|--[uU]pdate) UPDATE_ONLY="true" ;;
        -[lL]|--[lL]ight) LIGHT_MODE="true" ;;
        *) echo "Option doesn't exist"; exit 1 ;;
    esac
done

if [[ -z $OSX_SLACK_RESOURCES_DIR ]] || [[ -z $LINUX_SLACK_RESOURCES_DIR ]]; then echo "Please make sure Slack is installed /Applications (macOS) or /usr/local/slack (Linux)" && exit 1; fi

echo && echo "This script requires sudo privileges." && echo "You'll need to provide your password."

type npx
if [[ "$?" != "0" ]]; then echo "Please install NodeJS for your OS." && echo "macOS users will also need to install Homebrew from https://brew.sh" && exit 1; fi

if [[ -d $OSX_SLACK_RESOURCES_DIR ]]; then
    SLACK_RESOURCES_DIR=$OSX_SLACK_RESOURCES_DIR
fi

if [[ -d $LINUX_SLACK_RESOURCES_DIR ]]; then SLACK_RESOURCES_DIR=$LINUX_SLACK_RESOURCES_DIR; fi

if [[ "$1" == "-u" ]]; then UPDATE_ONLY="true"; fi

SLACK_EVENT_LISTENER="event-listener.js"
SLACK_FILEPATH="$SLACK_RESOURCES_DIR/app.asar.unpacked/dist/ssb-interop.bundle.js"
THEME_FILEPATH="$SLACK_RESOURCES_DIR/dark-theme.css"

#curl -sSL -o "$THEME_FILEPATH" "https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css"

if [[ "$UPDATE_ONLY" == "true" ]]; then echo && echo "Updating Dark Theme Code for Slack... "; fi

if [[ "$UPDATE_ONLY" == "false" ]]; then
    echo && echo "Adding Dark Theme Code to Slack... "
fi

if [[ -z $HOME ]]; then HOME=$(ls -d ~); fi

if [[ "$LIGHT_MODE" == "true" ]]; then
    echo "Removing Dark Theme... " && echo "Please refresh/restart Slack (ctrl/cmd + R) for changes to take affect." && sudo rm -f $THEME_FILEPATH
    exit
fi

# Copy CSS to Slack Folder
sudo cp -af dark-theme.css "$THEME_FILEPATH"

# If we Have a Custom File, Append to the End
if [[ -f custom-dark-theme.css ]]; then
    echo "Adding Custom CSS to Dark Theme... " && cat custom-dark-theme.css >> "$THEME_FILEPATH"
fi

if [[ "$UPDATE_ONLY" == "false" ]]; then
    # Modify Local Settings
    if [[ -f "$HOME/$SLACK_DIRECT_LOCAL_SETTINGS" ]]; then sed -i 's/"bootSonic":"[^"]*"/"bootSonic":"never"/g' "$HOME/$SLACK_DIRECT_LOCAL_SETTINGS"; fi

    if [[ -f "$HOME/$SLACK_STORE_LOCAL_SETTINGS" ]]; then sudo sed -i 's/"bootSonic":"[^"]*"/"bootSonic":"never"/g' "$HOME/$SLACK_STORE_LOCAL_SETTINGS"; fi

    # Unpack Asar Archive for Slack
    sudo "PATH=$PATH" npx asar extract $SLACK_RESOURCES_DIR/app.asar $SLACK_RESOURCES_DIR/app.asar.unpacked

    # Add JS Code to Slack
    sudo tee -a "$SLACK_FILEPATH" > /dev/null < $SLACK_EVENT_LISTENER

    # Insert the CSS File Location in JS
    sudo sed -i -e s@SLACK_DARK_THEME_PATH@$THEME_FILEPATH@g $SLACK_FILEPATH

    # Pack the Asar Archive for Slack
    sudo "PATH=$PATH" npx asar pack $SLACK_RESOURCES_DIR/app.asar.unpacked $SLACK_RESOURCES_DIR/app.asar
fi

echo && echo "Done! After executing this script restart Slack for changes to take effect."

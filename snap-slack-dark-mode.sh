#!/usr/bin/env bash
# Usage: ./snap-slack-dark-mode.sh
#   [-u] for update only.
#   [-light] to revert to light mode.

SLACK_RESOURCES_DIR="/snap/slack/current/usr/lib/slack/resources"
ssb_js_dir="/opt/slack-dark" # directory where to place our adjusted js file.
UPDATE_ONLY="false"

if ! [[ -d $SLACK_RESOURCES_DIR ]]; then echo "You do not have snap version of slack installed."; exit; fi


for arg in "$@"; do
    shift
    case "$arg" in
        -u) UPDATE_ONLY="true" ;;
        -light)
            echo "Removing Dark mode"
            sudo killall slack 2>/dev/null
            sudo umount /snap/slack/current/usr/lib/slack/resources/app.asar
            exit
            ;;
        *) echo "Option doesn't exist"; exit 1 ;;
    esac
done

echo && echo "This script requires sudo privileges." && echo "You'll need to provide your password."

type npx
if [[ "$?" != "0" ]]; then echo "Please install Node"; exit; fi

# ensure we don't have the mount already
sudo umount /snap/slack/current/usr/lib/slack/resources/app.asar 2>/dev/null

# make sure we have a directory to mount the adjusted file from.
sudo mkdir -p "$ssb_js_dir/app.asar.unpacked/dist/"

SLACK_EVENT_LISTENER="event-listener.js"
SLACK_FILEPATH="$ssb_js_dir/app.asar.unpacked/dist/ssb-interop.bundle.js"
THEME_FILEPATH="$ssb_js_dir/dark-theme.css"

case "$UPDATE_ONLY" in
    "true") echo && echo "Updating Dark Theme Code for Slack... " ;;
    "false") echo && echo "Adding Dark Theme Code to Slack... "  ;;
esac

# Copy CSS to Slack Folder
sudo cp -af dark-theme.css "$THEME_FILEPATH"

# if we have a custom file, append to the end.
if [[ -f custom-dark-theme.css ]]; then
    echo "Adding custom css"
    cat custom-dark-theme.css >> "$THEME_FILEPATH"
fi

if [[ "$UPDATE_ONLY" == "false" ]]; then
    # Unpack Asar Archive for Slack
    sudo npx asar extract $SLACK_RESOURCES_DIR/app.asar $ssb_js_dir/app.asar.unpacked

    # Add JS Code to Slack
    sudo tee -a "$SLACK_FILEPATH" < $SLACK_EVENT_LISTENER

    # Insert the CSS File Location in JS
    sudo sed -i -e s@SLACK_DARK_THEME_PATH@$THEME_FILEPATH@g $SLACK_FILEPATH

    # Pack the Asar Archive for Slack
    sudo npx asar pack $ssb_js_dir/app.asar.unpacked $ssb_js_dir/app.asar

    sudo mount --bind -o nodev,ro $ssb_js_dir/app.asar $SLACK_RESOURCES_DIR/app.asar

    isTabbed=$(sudo crontab -l | grep $ssb_js_dir/app.asar)
    if ! [[ $isTabbed ]]; then
        echo "Installing new crontab to apply on reboot..."
        # Save current crontab
        sudo crontab -l | sudo tee tab.tmp
        # Add new tab
        echo "@reboot sudo mount --bind -o nodev,ro /opt/slack-dark/app.asar /snap/slack/current/usr/lib/slack/resources/app.asar" >> tab.tmp
        # replace crontab
        sudo crontab tab.tmp
        sudo rm tab.tmp
    fi
fi

#!/usr/bin/env bash

# Homebaked Slack Dark Mode. After executing this script, hit refresh (⌘ + R) or restart Slack for changes to take effect.
# Adopted from https://gist.github.com/a7madgamal/c2ce04dde8520f426005e5ed28da8608

SLACK_RESOURCES_DIR="/Applications/Slack.app/Contents/Resources"
SLACK_FILEPATH="$SLACK_RESOURCES_DIR/app.asar.unpacked/src/static/ssb-interop.js"
THEME_FILEPATH="$SLACK_RESOURCES_DIR/dark-theme.css"

#curl -sSL -o "$THEME_FILEPATH" "https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css"
cp -af black.css "$THEME_FILEPATH"

echo "Modifying Slack... "

echo "
document.addEventListener('DOMContentLoaded', function() {
  const fs = require('fs');
  const filePath = '$THEME_FILEPATH';
  const tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
  fs.readFile(filePath, {encoding: 'utf-8'}, function(err, css) {
    if (!err) {
      \$('<style></style>').appendTo('head').html(css + tt__customCss);
      \$('<style></style>').appendTo('head').html('#reply_container.upload_in_threads .inline_message_input_container {background: padding-box #545454}');
      \$('<style></style>').appendTo('head').html('.p-channel_sidebar {background: #363636 !important}');
      \$('<style></style>').appendTo('head').html('#client_body:not(.onboarding):not(.feature_global_nav_layout):before {background: inherit;}');
    }
  });
});
" >> "$SLACK_FILEPATH"

echo "Done! After executing this script, hit refresh (⌘ + R) or restart Slack for changes to take effect."

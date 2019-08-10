---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: Slack Dark Mode
---

Purpose
============

Store scripts and Style sheets for Slack Dark Mode for macOS Mojave.\
Dark Mode in Slack isn't available as of this writing.

Notice
============

Due to the changes in Slack 4.0+ this project will not be compatible with Slack Version 3.4 or below.\
If you're looking for 3.4.x compatible settings please refer to [this](https://github.com/LanikSJ/slack-dark-mode/tree/466ff22d5b606b6d5b2edeff54f4cd7a3bafc39c).

Usage
============

For macOS Users:
```bash
$ git clone https://github.com/LanikSJ/slack-dark-mode && cd slack-dark-mode \
&& chmod +x slack-dark-mode.sh && ./slack-dark-mode.sh \
&& osascript -e 'tell application "Slack" to quit' \
&& killall Slack && sleep 60 && open -a "/Applications/Slack.app"
```
or to update CSS only:
```bash
$ git clone https://github.com/LanikSJ/slack-dark-mode && cd slack-dark-mode \
&& chmod +x slack-dark-mode.sh && ./slack-dark-mode.sh -u \
&& osascript -e 'tell application "Slack" to quit' \
&& killall Slack && sleep 60 && open -a "/Applications/Slack.app"
````
For SNAP users: Since snap is a 'read-only' file system, we have to mount the changes. The script automatically insert a new crontab so it will persist through reboots.\
Since the way SNAPS work are different, we can easily revert to light mode as well with the script.
```bash
./snap-slack-dark-mode.sh [-u] [-light]
```
For Windows Users:
```powershell
PS ~/> git clone https://github.com/LanikSJ/slack-dark-mode
PS ~/> cd slack-dark-mode; .\slack-dark-mode.ps1
```
or to update CSS only:
```powershell
PS ~/> git clone https://github.com/LanikSJ/slack-dark-mode
PS ~/> cd slack-dark-mode; .\slack-dark-mode.ps1 -UpdateOnly
```
You can tweak your own css colors by creating a new file called custom-dark-theme.css,
which will be used to overwrite the current theme.

Screenshot
============
![Screenshot](https://github.com/LanikSJ/slack-dark-mode/raw/master/images/screenshot.png "Screenshot")

Attributions
============

Scripts was "borrowed" from [mmrko](https://gist.github.com/mmrko) [Gist](https://gist.github.com/mmrko/9b0e65f6bcc1fca57089c32c2228aa39)\
©️ All rights reserved by the original authors.

Bugs
============

Please report any bugs or issues you find. Thanks!

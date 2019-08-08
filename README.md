# Slack Dark Mode for macOS Mojave and Beyond
[![Build Status](https://travis-ci.com/LanikSJ/slack-dark-mode.svg?branch=master)](https://travis-ci.com/LanikSJ/slack-dark-mode)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=LanikSJ/slack-dark-mode)](https://dependabot.com)
[![Known Vulnerabilities](https://snyk.io/test/github/laniksj/slack-dark-mode/badge.svg?targetFile=/docs/Gemfile.lock)](https://snyk.io/test/github/laniksj/slack-dark-mode?targetFile=/docs/Gemfile.lock)

## Purpose
Store scripts and Style sheets for Slack Dark Mode for macOS Mojave.  
Dark Mode in Slack isn't available as of this writing.

## Notice
Due to the changes in Slack 4.0+ this project will not be compatible with Slack Version 3.4 or below.  
If you're looking for 3.4.x compatible settings please refer to [this](https://github.com/LanikSJ/slack-dark-mode/tree/466ff22d5b606b6d5b2edeff54f4cd7a3bafc39c).

## Usage
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e88f5c76dfdf418e9c2571943437ae23)](https://www.codacy.com/app/Lanik/slack-dark-mode?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LanikSJ/slack-dark-mode&amp;utm_campaign=Badge_Grade)
[![codecov](https://codecov.io/gh/LanikSJ/slack-dark-mode/branch/master/graph/badge.svg)](https://codecov.io/gh/LanikSJ/slack-dark-mode)

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

You can tweak your own css colors by creating a new file called `custom-dark-theme.css`, which will be used to overwrite the current theme.

## Screenshot
![Screenshot](https://github.com/LanikSJ/slack-dark-mode/raw/master/images/screenshot.png "Screenshot")

## Attributions
Some scripts were "borrowed" from [mmrko](https://gist.github.com/mmrko) [Gist](https://gist.github.com/mmrko/9b0e65f6bcc1fca57089c32c2228aa39)  
©️ All rights reserved by the original authors.

## Bugs
Please report any bugs or issues you find. Thanks!

## License
[![GPLv3 License](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)

## Donate
[![Patreon](https://img.shields.io/badge/patreon-donate-red.svg)](https://www.patreon.com/laniksj/overview)

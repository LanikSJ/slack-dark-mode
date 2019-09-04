---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: Slack Dark Mode
---

[![Build Status](https://travis-ci.com/LanikSJ/slack-dark-mode.svg?branch=master)](https://travis-ci.com/LanikSJ/slack-dark-mode)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=LanikSJ/slack-dark-mode)](https://dependabot.com)
[![Known Vulnerabilities](https://snyk.io/test/github/laniksj/slack-dark-mode/badge.svg?targetFile=/docs/Gemfile.lock)](https://snyk.io/test/github/laniksj/slack-dark-mode?targetFile=/docs/Gemfile.lock)

-   [Purpose](#purpose)
-   [Screenshot](#screenshot)
-   [Notice](#notice)
-   [Usage](#usage)
    -   [For All Systems/OS](#for-all-systems-os)
    -   [For macOS and Linux](#for-macos-and-linux)
        -   [Update CSS Only](#update-css-only)
        -   [Revert to Light Mode](#revert-to-light-mode)
    -   [For Linux SNAP](#for-linux-snap)
        -   [Update CSS Only (SNAP)](#update-css-only--snap-)
        -   [Revert to Light Mode (SNAP)](#revert-to-light-mode--snap-)
    -   [For Windows Users](#for-windows-users)
        -   [Update CSS Only (Windows)](#update-css-only--windows-)
        -   [Revert to Light Mode (Windows)](#revert-to-light-mode--windows-)
    -   [Dark Mode Toggle](#dark-mode-toggle)
-   [Attributions](#attributions)
-   [Bugs](#bugs)
-   [License](#license)
-   [Donate](#donate)

## Purpose

Store scripts and Style sheets for Slack Desktop Dark Mode.
Native Dark Mode in Slack isn't available as of this writing.

The following platforms are supported in this repo via scripts:

-   macOS [slack-dark-mode.s](slack-dark-mode.s)
-   Linux [slack-dark-mode.sh](slack-dark-mode.sh)
-   Linux SNAP [snap-slack-dark-mode.sh](snap-slack-dark-mode.sh)
-   Windows [slack-dark-mode.ps1](slack-dark-mode.ps1)

## Screenshot

![Screenshot](https://github.com/LanikSJ/slack-dark-mode/raw/master/images/screenshot.png "Screenshot")

## Notice

Due to the changes in Slack 4.0+ this project will not be compatible with Slack Version 3.4 or below.
If you're looking for 3.4.x compatible settings please refer to [this](https://github.com/LanikSJ/slack-dark-mode/tree/466ff22d5b606b6d5b2edeff54f4cd7a3bafc39c).

## Usage

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e88f5c76dfdf418e9c2571943437ae23)](https://www.codacy.com/app/Lanik/slack-dark-mode?utm_source=github.com&utm_medium=referral&utm_content=LanikSJ/slack-dark-mode&utm_campaign=Badge_Grade)
[![codecov](https://codecov.io/gh/LanikSJ/slack-dark-mode/branch/master/graph/badge.svg)](https://codecov.io/gh/LanikSJ/slack-dark-mode)

In general, you should completely close out of Slack before or after you run the install scripts. This will ensure that everything is properly updated. Once the script has been run the first time, if you ever need to update the CSS styles, you can simply use `ctrl + r` or `cmd + r` in macOS to reload Slack and update the CSS, if the scripts below do not automatically close Slack for you.

### For All Systems/OS

First, clone the repository

```bash
git clone https://github.com/LanikSJ/slack-dark-mode
cd slack-dark-mode
```

Then shutdown Slack and please reference for your operating system:

### For macOS and Linux

```bash
./slack-dark-mode.sh
```

#### Update CSS Only

```bash
./slack-dark-mode.sh -u
```

#### Revert to Light Mode

```bash
./slack-dark-mode.sh -l
```

### For Linux SNAP

Since snap is a 'read-only' file system, we have to mount the changes.
The script automatically insert a new crontab so it will persist through reboots.
Since the way SNAPS work are different, we can easily revert to light mode as well with the script.
Note: This script will automatically kill Slack when the `-u` flag is not used to ensure the mount is not busy.

```bash
./snap-slack-dark-mode.sh
```

#### Update CSS Only (SNAP)

```bash
./snap-slack-dark-mode.sh -u
```

#### Revert to Light Mode (SNAP)

```bash
./snap-slack-dark-mode.sh -l
```

### For Windows Users

Open Powershell in Admin mode:  
Note: This script will automatically kill Slack each time you update.

```powershell
.\slack-dark-mode.ps1
```

#### Update CSS Only (Windows)

```powershell
.\slack-dark-mode.ps1 -UpdateOnly
```

#### Revert to Light Mode (Windows)

```powershell
.\slack-dark-mode.ps1 -LightMode
```

If you want to make your own tweaks to the css, you can create a file called `custom-dark-theme.css` in the root of the repository, which will be appended to the end of the main css so you can easily keep your changes through updates of the repo.

### Dark Mode Toggle

If you want to toggle Dark Mode on or off you can use Ctrl + L (lower case) on any OS.

## Attributions

Scripts was "borrowed" from [mmrko](https://gist.github.com/mmrko) [Gist](https://gist.github.com/mmrko/9b0e65f6bcc1fca57089c32c2228aa39)
©️ All rights reserved by the original authors.

## Bugs

Please report any bugs or issues you find. Thanks!

## License

[![GPLv3 License](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)

## Donate

[![PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=ARJNJE9TBTPH4&currency_code=USD&source=url)

[![Patreon](https://img.shields.io/badge/patreon-donate-red.svg)](https://www.patreon.com/laniksj/overview)

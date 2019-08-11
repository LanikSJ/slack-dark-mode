# Slack Desktop Dark Mode

[![Build Status](https://travis-ci.com/LanikSJ/slack-dark-mode.svg?branch=master)](https://travis-ci.com/LanikSJ/slack-dark-mode)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=LanikSJ/slack-dark-mode)](https://dependabot.com)
[![Known Vulnerabilities](https://snyk.io/test/github/laniksj/slack-dark-mode/badge.svg?targetFile=/docs/Gemfile.lock)](https://snyk.io/test/github/laniksj/slack-dark-mode?targetFile=/docs/Gemfile.lock)

## Purpose

Store scripts and Style sheets for Slack Desktop Dark Mode.\\
Native Dark Mode in Slack isn't available as of this writing.

The following platforms are supported in this repo via scripts:

-   macOS Mojave: [slack-dark-mode.sh](slack-dark-mode.sh)
-   Linux: [slack-dark-mode.sh](slack-dark-mode.sh)
    -   Linux SNAP installs: [snap-slack-dark-mode.sh](snap-slack-dark-mode.sh)
-   Windows: [slack-dark-mode.ps1](slack-dark-mode.ps1)

## Notice

Due to the changes in Slack 4.0+ this project will not be compatible with Slack Version 3.4 or below.\\
If you're looking for 3.4.x compatible settings please refer to [this](https://github.com/LanikSJ/slack-dark-mode/tree/466ff22d5b606b6d5b2edeff54f4cd7a3bafc39c).

## Usage

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e88f5c76dfdf418e9c2571943437ae23)](https://www.codacy.com/app/Lanik/slack-dark-mode?utm_source=github.com&utm_medium=referral&utm_content=LanikSJ/slack-dark-mode&utm_campaign=Badge_Grade)
[![codecov](https://codecov.io/gh/LanikSJ/slack-dark-mode/branch/master/graph/badge.svg)](https://codecov.io/gh/LanikSJ/slack-dark-mode)

In general, you should completely close out of slack before or after you run the install scripts. This will ensure that everything is properly updated. Once the script has been run the first time, if you ever need to update the CSS styles, you can simply use `ctrl + r` to reload slack and update the CSS, if the scripts below do not automatically close slack for you.

### For all systems

First, clone the repository

```bash
$ git clone https://github.com/LanikSJ/slack-dark-mode 
$ cd slack-dark-mode
```

Then shutdown slack and please reference for your operating system:

#### For macOS and basic Linux installs

```bash
$ ./slack-dark-mode.sh
# or to update CSS only:
$ ./slack-dark-mode.sh -u
```

#### For Linux SNAP installs

Since snap is a 'read-only' file system, we have to mount the changes.\\
The script automatically insert a new crontab so it will persist through reboots.\\
Since the way SNAPS work are different, we can easily revert to light mode as well with the script.\\
Note: This script will automatically kill slack when the `-u` flag is not used to ensure the mount is not busy.

```bash
$ ./snap-slack-dark-mode.sh
# or to update CSS only:
$ ./snap-slack-dark-mode.sh -u
# or to revert to Light mode
$ ./snap-slack-dark-mode.sh -light
```

#### For Windows Users

Open Powershell in Admin mode:\\
Note: This script will automatically kill slack each time you update.

```powershell
PS ~/> .\slack-dark-mode.ps1
# or to update CSS only:
PS ~/> .\slack-dark-mode.ps1 -UpdateOnly
```

If you want to make your own tweaks to the css, you can create a file called `custom-dark-theme.css` in the root of the repository, which will be appended to the end of the main css so you can easily keep your changes through updates of the repo.

## Screenshot

![Screenshot](https://github.com/LanikSJ/slack-dark-mode/raw/master/images/screenshot.png "Screenshot")

## Attributions

Some scripts were "borrowed" from [mmrko](https://gist.github.com/mmrko) [Gist](https://gist.github.com/mmrko/9b0e65f6bcc1fca57089c32c2228aa39)\\
©️ All rights reserved by the original authors.

## Bugs

Please report any bugs or issues you find. Thanks!

## License

[![GPLv3 License](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)

## Donate

[![Patreon](https://img.shields.io/badge/patreon-donate-red.svg)](https://www.patreon.com/laniksj/overview)

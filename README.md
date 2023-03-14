# dotfiles

My personal dotfiles

Project

[![License](https://img.shields.io/github/license/d3strukt0r/dotfiles)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](CODE_OF_CONDUCT.md)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Homebrew - <https://brew.sh/> - Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` on macOS
* Git - Download on <https://git-scm.com/> or run `brew install git` on macOS

### Installing

For first-time setup

```sh
git clone -b macOS https://github.com/D3strukt0r/dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install
```

Run dotbot to link config files

```sh
cd ~/.dotfiles && git pull && ./install
```

Install all packages from `Brewfile`

```sh
brew tap homebrew/bundle
brew bundle
```

#### Update Backup

Dump currently installed packages in Brewfile

```sh
cd ~/.dotfiles
brew bundle dump -f
```

Remove all packages not mentioned in `Brewfile`

```sh
brew bundle cleanup
```

#### Updating

antigen

```sh
antigen update
```

#### Manual installs

* Download & Install VirtualBox Extension from <https://www.virtualbox.org/wiki/Downloads>
* Install PhpStorm from Jetbrains Toolbox App
* Restore GPG Key from File Backup and install in GPG Suite
* Restore id_rsa & id_ed25519 from Password Manager (for Work)
* Install global certificate `mkcert -install`
* Fix iTerm2 font for powerlevel10k with `p10k configure`
* Install [https://github.com/nvm-sh/nvm](nvm) `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash`
* Install latest node `nvm install --lts`
* Install yarn `npm install --global yarn`
* Install pnpm `npm install --global pnpm`
* Install PHP-CS-Fixer `phive install --global php-cs-fixer`
* Install PHPStan `phive install --global phpstan`
* Install PhpUnit `phive install --global phpunit`
* Download & Install Xencelabs Drivers from <https://www.xencelabs.com/eu/support/download-drivers>
* Download & Install 3CX from <https://pbx.hdw.ch/webclient/api/app/mac>
* Download & Install Banana Buchhaltung from <https://www.banana.ch/doc9/de/node/9737>
* Install Adobe Acrobat DC from Creative Cloud App
* Add Macro to Logitech G: Back `cmd + ö` and Forward `cmd + ä`
* Add uBlock Origin Source in Browsers from <https://github.com/StevenBlack/hosts>
* Finish installation of Forticlient with `open /usr/local/Caskroom/forticlient-vpn/7.0/FortiClientUpdate.app`. Unlock settings with 🔒 and restore from File Backup "FortiClient"

Allow starting/stopping vagrant without password

```shell
sudo visudo -f /private/etc/sudoers.d/vagrant
```

Add the following line

```text
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
%admin     ALL = (root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
```

And allow hosts-updater to update hosts file automatically with

```shell
sudo visudo -f /private/etc/sudoers.d/vagrant_hostsupdater
```

Add the following line

```text
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin     ALL = (root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE
```

## Built With

Nothing needed

## Contributing

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct, and [CONTRIBUTING.md](CONTRIBUTING.md) for the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository][gh-tags].

## Authors

All the authors can be seen in the [AUTHORS.md](AUTHORS.md) file.

Contributors can be seen in the [CONTRIBUTORS.md](CONTRIBUTORS.md) file.

See also the full list of [contributors][gh-contributors] who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details

## Acknowledgments

A list of used libraries and code with their licenses can be seen in the [ACKNOWLEDGMENTS.md](ACKNOWLEDGMENTS.md) file.

[gh-tags]: https://github.com/D3strukt0r/dotfiles/tags
[gh-contributors]: https://github.com/D3strukt0r/dotfiles/contributors

# dotfiles

My personal dotfiles

Project

[![License](https://img.shields.io/github/license/d3strukt0r/dotfiles)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](CODE_OF_CONDUCT.md)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* File system without Case-Sensitive. `Epic Games Launcher`, `Steam`, `Microsoft OneDrive` and `Adobe Creative Cloud` don't work with it.
* [Homebrew](https://brew.sh/) - Run `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* [Git](https://git-scm.com/) - Run `brew install git`

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

#### Manual Configuration (CLI)

* Restore GPG Key from File Backup and install in GPG Suite or run `gpg --import-options import-restore --import private.gpg`
* Restore `id_rsa` & `id_ed25519` from Password Manager (for Work)
* Install global certificate `mkcert -install`
* Fix `nvim` installation in `~/.local` with `sudo chown manuele -R ~/.local`
* Install [docker-credential-pass](https://github.com/docker/docker-credential-helpers/releases/download/v0.7.0/docker-credential-pass-v0.7.0.darwin-amd64)
  * `chmod +x docker-credential-pass-v0.7.0.darwin-amd64`
  * `mv docker-credential-pass-v0.7.0.darwin-amd64 /usr/local/bin/docker-credential-pass`
  * Use `Finder` > Right Click > `Open` once to bypass malware check failing
* Install `vim-plug` [GitHub](https://github.com/junegunn/vim-plug#unix-linux) `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
* Install all `nvim` plugins by running `nvim` and executing `:PlugInstall!` (eventually multiple times)
* Fix iTerm2 font for powerlevel10k with `p10k configure`
* Install iTerm2 Shell Integration. Open `iTerm2` > Toolbar > `iTerm2` > `Instell Shell Integration`
* Install [nvm](https://github.com/nvm-sh/nvm) `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash`
* Install latest node `nvm install --lts`
* Install pnpm `npm install --global pnpm` & `pnpm install --global`
* Create link with `npmrc`, login with `npm login`, create new profile `npmrc -c work-iwf` and set new registry and login with `npm login --registry https://npm.iwf.io` (use LDAP username and GitLab Verdaccio Access Token) and set default registry `npm config set registry https://npm.iwf.io`
* Install composer `phive install --global composer`
* Add GitHub Token to increased API rate limit `composer config --global github-oauth.github.com TOKEN`. Get `TOKEN` from password manager
* Install PHP-CS-Fixer `phive install --global php-cs-fixer`
* Install PHP_CodeSniffer `phive install --global phpcs phpcbf`
* Install PhpUnit `phive install --global phpunit`
* Install rector `composer global require rector/rector`
* Install PHPStan and extensions `composer global require phpstan/phpstan phpstan/extension-installer phpstan/phpstan-doctrine phpstan/phpstan-phpunit phpstan/phpstan-symfony`
* Login to Ngrok `ngrok config add-authtoken TOKEN`. Get `TOKEN` from password manager
* Login to GitHub Copilot CLI `github-copilot-cli auth`
* Get passwords managed with `pass`: `git clone git@github.com:D3strukt0r/pass-store.git ~/.password-store`
* Add uBlock Origin Source in Browsers from [StevenBlack/hosts](https://github.com/StevenBlack/hosts)
* Finish installation of Forticlient with `open /usr/local/Caskroom/forticlient-vpn/7.0/FortiClientUpdate.app`. Unlock settings with 🔒 and restore from File Backup "FortiClient"
* Finish installation of Battle.net with `open /usr/local/Caskroom/battle-net/1.18.5.3106/Battle.net-Setup.app`
* Login to [Abraxas](https://uvek.abx-ras.ch/) and get the F5 VPN Client
* Make sure `asimov` is running for excluding project dependencies in Time Machine Backups with `sudo brew services start asimov` and/or run `asimov` to run manually
* Allow starting/stopping vagrant without password by running `sudo visudo -f /private/etc/sudoers.d/vagrant` and adding the following lines:

```text
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
%admin     ALL = (root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
```

* And allow hosts-updater to update hosts file automatically with `sudo visudo -f /private/etc/sudoers.d/vagrant_hostsupdater` and adding following lines:

```text
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin     ALL = (root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE
```

* (Work) SSH Host Keys must be saved locally before being able to run `swarm-{x}` commands. Run following commands while entering `yes`to accept ssh key and then entering `exit`:

```shell
for node in 1 2 3 4 5; do swarm-worker test-worker-$node; done
for node in 1 2 3 4 5; do swarm-worker prod-worker-$node; done
```

#### Manual System Settings Configuration

* Add Time Machine Exclusions in `Systemeinstellungen` > `Time Machine` > `[Optionen ...]`
  * `~/Library/CloudStorage`
  * `~/VirtualBox VMs`
  * `/Applications`
* Add Printers in `Systemeinstellungen` > `Drucker & Scanner` > `[+]` > `IP` (Icon)
  * `10.1.41.40` | `HP Jetdirect - Socket` | `Drucker - 4. OG (IWF Intern)`
  * `10.1.41.36` | `HP Jetdirect - Socket` | `Drucker - 4. OG (Nord)`
* Fix Vanilla Open state has empty space by switching `Systemeinstellungen` > `Dock & Menüleiste` > `Uhr` > `Datum anzeigen` to `Immer`
* Disable Tips Notification `Systemeinstellungen` > `Mitteilungen & Fokus` > `Tipps` > `Mitteilungen erlauben` > Aus
* Add US English keyboard in `Systemeinstellungen` > `Tastatur` > `Eingabequellen` > `[+]` > `English` > `US` > `Hinzufügen`
* Add quick keyboard switcher in `Systemeinstellungen` > `Tastatur` > `Beim Drücker der fn-Taste` > `Eingabequellen wechseln`
* Change Default window switching shortcut `Systemeinstellungen` > `Tastatur` > `Kurzbefehle` > `Tastatur` > `Fokus in nächstes Fenster` > `⌘ + (key left from y (QWERTZ) -> >,<)`

#### Manual App Installation

* [3CX](https://pbx.hdw.ch/webclient/api/app/mac)
* [Atlassian Companion](https://update-nucleus.atlassian.com/Atlassian-Companion/291cb34fe2296e5fb82b83a04704c9b4/latest/darwin/x64/Atlassian%20Companion.dmg) [Docs](https://confluence.atlassian.com/doc/install-atlassian-companion-992678880.html)
* [Banana Buchhaltung](https://www.banana.ch/doc9/de/node/9737)
* Install `Adobe Acrobat DC` from `Creative Cloud App`
* [Filezilla](https://filezilla-project.org/download.php?type=client)
* Install `PhpStorm` and `Android Studio` from `JetBrains Toolbox App`
* [LDAP Admin Tool](https://ldapsoft.com/ldapbrowser/ldapadmintool.html)
* [NighOwl](https://nightowlapp.co/)
* [VirtualBox Extension](https://www.virtualbox.org/wiki/Downloads)
* [Xencelabs Drivers](https://www.xencelabs.com/eu/support/download-drivers)

#### Manual App Configuration

* `3CX`
  * (Desktop), go to [any page](https://pbx.hdw.ch/webclient/#/people) > 🍎 > `Provisionieren`
  * (Mobile), log in at <https://pbx.hdw.ch/webclient/#/login> > `...` > `Einstellungen` > `QR-Code scannen`
* `aText`
  * Snippets
    * `dbimp` > `cat /vagrant/{pointer} | docker exec -i db sh -c 'mysql --default-character-set=utf8 -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE'`
    * `gitcp` > `git --git-dir=../{pointer}/.git format-patch -k -1 --stdout <> | git am -3 -k`
    * `paste` > `{clipboard}`
* `GitKraken`
  * `Settings`
    * `General`
      * `Default Branch Name` > `master`
      * `Default External Terminal` > `iTerm2`
    * `Notifications` > `Enable Desktop Notifications` > `[x]`
    * `Terminal`
      * `Font`: `MesloLGS NF`
      * `Line Height`: `1.3`
  * <Project> Jira Issues
    * My Issues: `project = "x" AND assignee = currentUser() AND resolution = Unresolved`
    * Current Issues: `project = "x" AND resolution = Unresolved AND Sprint in openSprints() AND Sprint not in futureSprints()`
* `iTerm2`
  * `iTerm2` > `Preferences...` > `Profiles` > `<Profile Name: Default>` > `Keys` > `Key Mappings` > `(...) Presets...` > `Natural Text Editing`
* `Logitech G`
  * Add Macro to Mouse:
    * Back: `cmd + ö`
    * Forward: `cmd + ä`
* `Microsoft Remote Desktop`
  * PCs (Check Notes app for credentials)
    * `Vertec Prod`: `192.168.6.114`
    * `Vertec Test`: `192.168.6.113`
    * `SAGE Test`: `192.168.6.181`
* `Nightowl`
  * Toolbar Icon > `...` > `Hotkey` > `[ ]` Turn off
* `Pika`
  * When opening for the first time, select `Open at startup` (or similar)
* `Private Internet Access`
  * Toolbar Icon > Hamburger Menu > `Einstellungen` > `Allgemein` > `Beim Systemstart öffnen` > `[x]`
* `Scroll Reverser`
  * Toolbar Icon > `Einstellungen...`
    * [x] Vertikal umkehren
    * [x] Horizontal umkehren
    * [ ] Trackpad umkehren
    * [x] Maus umkehren
* `Telegram Desktop`
  * Burger Menu > `Night Mode` > On
* `TextSniper`
  * Toolbar Icon > `Preferences...` > `System` > `Launch at Login` > `[x]`
* `The Unarchiver`
  * `Extrahieren` > `Änderungsdatum des neu erstellten Ordner ändern auf:` > `Änderungsdatum der Archivdatei`
* `Ultimaker Cura`
  * Add Printer `Creality Ender-3 Pro`
  * Printer Settings
    * X: 235
    * Y: 235
    * Z: 250
  * Printhead Settings
    * X min: -58
    * Y min: -20
    * X max: 40
    * Y max: 34
    * Gantry Height: 25.0
  * `Preferences` > `Configure Cura...`
    * `General` > `Theme` > `Ultimaker Dark`

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

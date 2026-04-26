# macOS / Laptop (Personal)

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
git clone https://github.com/D3strukt0r/dotfiles ~/.dotfiles && cd ~/.dotfiles/macOS/Laptop-Robine && ./install
```

Run dotbot to link config files

```sh
cd ~/.dotfiles/macOS/Laptop-Robine && git pull && ./install
```

Install all packages from `Brewfile`

```sh
brew bundle -v
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

#### Manual Configuration (CLI)

* Restore GPG Key from `{backup}/GPG Keys/*` and install in GPG Suite or run `gpg --import-options import-restore --import private.gpg`
* Fix iTerm2 font for powerlevel10k with `p10k configure`
* Install iTerm2 Shell Integration. Open `iTerm2` > Toolbar > `iTerm2` > `Instell Shell Integration`
* Add uBlock Origin Source in Browsers from [StevenBlack/hosts](https://github.com/StevenBlack/hosts)

#### Manual System Settings Configuration

* Add Time Machine Exclusions in `Systemeinstellungen` > `Time Machine` > `[Optionen ...]`
  * `~/Library/CloudStorage`
  * `/Applications`
* Fix Vanilla Open state has empty space by switching `Systemeinstellungen` > `Kontrollzentrum` > `Uhr` > `Datum anzeigen` to `Immer`
* Disable Tips Notification `Systemeinstellungen` > `Mitteilungen & Fokus` > `Tipps` > `Mitteilungen erlauben` > Aus
* Add quick keyboard switcher in `Systemeinstellungen` > `Tastatur` > `Beim Drücker der fn-Taste` > `Eingabequellen wechseln`
* Change Default window switching shortcut `Systemeinstellungen` > `Tastatur` > `Kurzbefehle` > `Tastatur` > `Fokus in nächstes Fenster` > `⌘ + (key left from y (QWERTZ) -> >,<)`

#### Manual App Installation

* Install `Adobe Acrobat DC` from `Creative Cloud App`

#### Manual App Configuration

* `iTerm2`
  * `iTerm2` > `Preferences...` > `Profiles` > `<Profile Name: Default>` > `Keys` > `Key Bindings` > `(...) Presets...` > `Natural Text Editing`
* `Logitech G`
  * Add Macro to Mouse:
    * Back: `cmd + ö`
    * Forward: `cmd + ä`
* `Pika`
  * When opening for the first time, select `Open at startup` (or similar)
* `Scroll Reverser`
  * Toolbar Icon > `Einstellungen...`
    * [x] Vertikal umkehren
    * [x] Horizontal umkehren
    * [ ] Trackpad umkehren
    * [x] Maus umkehren
* `TextSniper`
  * Toolbar Icon > `Preferences...` > `System` > `Launch at Login` > `[x]`
* `The Unarchiver`
  * `Extrahieren` > `Änderungsdatum des neu erstellten Ordner ändern auf:` > `Änderungsdatum der Archivdatei`

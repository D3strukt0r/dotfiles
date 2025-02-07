# Linux / Steam Deck (SteamOS)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* SteamOS - [Help Page](https://help.steampowered.com/en/faqs/view/1B71-EDF2-EB6D-2BB3) - [Download](https://store.steampowered.com/steamos/download/?ver=steamdeck&snr=100601___)
* Steam Deck - [Steam Deck](https://www.steamdeck.com/)

### Installing

For first-time setup

```sh
git clone https://github.com/D3strukt0r/dotfiles ~/.dotfiles && cd ~/.dotfiles/Linux/Steam-Deck && ./install

mkdir ~/.ssh
chmod 700 ~/.ssh
# copy ssh keys from backup
chmod 600 ~/.ssh/id_ed25519_personal

# copy gpg keys from backup
gpg --import-options import-restore --import private.gpg

git remote set-url origin git@github.com:D3strukt0r/dotfiles.git
```

Run dotbot to link config files

```sh
cd ~/.dotfiles/Linux/Steam-Deck && git pull && ./install
```

Update list of installed flatpaks

```sh
flatpak list --app --columns=application > flatpaks.txt
```

#### Manual Configuration (CLI)

```bash
# 1Password
flatpak install https://downloads.1password.com/linux/flatpak/1Password.flatpakref
````

Update password store (see [Electron Docs](https://www.electronjs.org/docs/latest/api/safe-storage#safestoragegetselectedstoragebackend-linux))

Use Brave to setup the KDE Wallet before setting up other application that need a password store

```bash
cp /var/lib/flatpak/exports/share/applications/com.visualstudio.code.desktop ~/.local/share/applications/com.visualstudio.code.desktop
# Add "--password-store=gnome-libsecret" to arguments (https://github.com/flathub/com.visualstudio.code/issues/415)
sudo flatpak override --env=SIGNAL_PASSWORD_STORE=gnome-libsecret org.signal.Signal
```

Emu Deck - [Download](https://www.emudeck.com/EmuDeck.desktop) - [Website](https://www.emudeck.com/)  - [Help Page](https://emudeck.github.io/how-to-install-emudeck/steamos/)

```bash
ln -s . ~/EmuVirtual
# Select "Custom Directory" during install and choose ~/EmuVirtual
curl -sL https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash
```

Waydroid Installer - [Repository](https://github.com/ryanrudolfoba/SteamOS-Waydroid-Installer)

```bash
git clone --depth=1 https://github.com/ryanrudolfoba/steamos-waydroid-installer ~/steamos-waydroid-installer
cd ~/steamos-waydroid-installer
./steamos-waydroid-installer.sh
```

Decky - [Download](https://decky.xyz/download) - [Website](https://decky.xyz/) - [Instruction](https://wiki.deckbrew.xyz/en/user-guide/install) - [Repository](https://github.com/SteamDeckHomebrew/decky-installer)

```bash
curl -sL https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/user_install_script.sh | sudo bash
```

And install extensions

* SteamGridDB
* CSS Loader
* ProtonDB Badges
* Animation Changer
* PowerTools
* EmuDecky
* Audio Loader
* AutoFlatpaks
* DeckMTP
* HLTB for Deck
* Pause Games
* Emuchievements
* IsThereAnyDeal for Deck
* MagicPods
* MoonDeck
* Decky Cloud Save
* Quick Launch
* TunnelDeck
* CheatDeck
* MusicControl
* Controller Tools
* KDE Connect
* Shotty
* Syncthing
* PlayCount

An Anime Game Launcher - [Repository](https://github.com/an-anime-team/an-anime-game-launcher) - [Build Repository](https://github.com/an-anime-team/flatpak-builds)

```bash
flatpak remote-add --if-not-exists launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo
flatpak install launcher.moe moe.launcher.an-anime-game-launcher
```

CryoUtilities (Steam Deck Utilities) - [Repository](https://github.com/CryoByte33/steam-deck-utilities)

```bash
curl -sL https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/install.sh | bash -s --
```

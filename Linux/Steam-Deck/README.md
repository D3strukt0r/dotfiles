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
# restore ssh & gpg
# gpg --import-options import-restore --import private.gpg
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
# Office
flatpak install https://downloads.1password.com/linux/flatpak/1Password.flatpakref

# Messaging
flatpak override --env=SIGNAL_PASSWORD_STORE=kwallet org.signal.Signal
```

Emu Deck - [Download](https://www.emudeck.com/EmuDeck.desktop) - [Website](https://www.emudeck.com/)  - [Help Page](https://emudeck.github.io/how-to-install-emudeck/steamos/)

```bash
curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash
```

Waydroid Installer - [Repository](https://github.com/ryanrudolfoba/SteamOS-Waydroid-Installer)

```bash
git clone --depth=1 https://github.com/ryanrudolfoba/steamos-waydroid-installer ~/steamos-waydroid-installer
cd ~/steamos-waydroid-installer
chmod +x steamos-waydroid-installer.sh
./steamos-waydroid-installer.sh
```

Decky - [Download](https://decky.xyz/download) - [Website](https://decky.xyz/) - [Instruction](https://wiki.deckbrew.xyz/en/user-guide/install) - [Repository](https://github.com/SteamDeckHomebrew/decky-installer)

```bash
rm -f /tmp/user_install_script.sh
if curl -S -s -L -O --output-dir /tmp/ --connect-timeout 60 https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/user_install_script.sh; then
  bash /tmp/user_install_script.sh
else
  echo "Something went wrong, please report this if it is a bug"
  read
fi
```

An Anime Game Launcher - [Repository](https://github.com/an-anime-team/an-anime-game-launcher) - [Build Repository](https://github.com/an-anime-team/flatpak-builds)

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo
flatpak install launcher.moe moe.launcher.an-anime-game-launcher
```

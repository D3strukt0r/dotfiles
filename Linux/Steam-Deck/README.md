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
```

Run dotbot to link config files

```sh
cd ~/.dotfiles/Linux/Steam-Deck && git pull && ./install
```

```bash
flatpak list --app --system --columns=application | tr '\n' ' '
```

#### Manual Configuration (CLI)

```bash
# Office
flatpak install --system flathub com.brave.Browser
flatpak install --system flathub com.protonvpn.www
flatpak install --system flathub ch.protonmail.protonmail-bridge
flatpak install --system flathub com.calibre_ebook.calibre
flatpak install https://downloads.1password.com/linux/flatpak/1Password.flatpakref
flatpak install --system flathub eu.betterbird.Betterbird
flatpak install --system flathub md.obsidian.Obsidian
flatpak install --system flathub org.libreoffice.LibreOffice
flatpak install --system flathub me.kozec.syncthingtk
flatpak install --system flathub org.localsend.localsend_app

# Audio & Photo & Video
flatpak install --system flathub fr.handbrake.ghb
flatpak install --system flathub org.blender.Blender
flatpak install --system flathub org.gimp.GIMP
flatpak install --system flathub org.inkscape.Inkscape
flatpak install --system flathub org.videolan.VLC
flatpak install --system flathub org.audacityteam.Audacity

# 3D Design
flatpak install --system flathub com.prusa3d.PrusaSlicer
flatpak install --system flathub com.ultimaker.cura

# Development
flatpak install --system flathub io.neovim.nvim
flatpak install --system flathub com.axosoft.GitKraken
flatpak install --system flathub com.visualstudio.code
flatpak install --system flathub com.jetbrains.PhpStorm

# Entertainment
flatpak install --system flathub com.spotify.Client
flatpak install --system flathub com.mastermindzh.tidal-hifi

# Messaging
flatpak install --system flathub com.discordapp.Discord
flatpak install --system flathub org.signal.Signal
flatpak override --env=SIGNAL_PASSWORD_STORE=kwallet org.signal.Signal
flatpak install --system flathub org.telegram.desktop
flatpak install --system flathub com.slack.Slack
flatpak install --system flathub us.zoom.Zoom

# Tools
flatpak install --system flathub com.github.tchx84.Flatseal

# Gaming
flatpak install --system flathub com.rustdesk.RustDesk
flatpak install --system flathub com.moonlight_stream.Moonlight
flatpak install --system flathub com.heroicgameslauncher.hgl
flatpak install --system flathub com.usebottles.bottles
flatpak install --system flathub net.lutris.Lutris
flatpak install --system flathub io.github.philipk.boilr
flatpak install --system flathub net.davidotek.pupgui2 # ProtonUp-Qt
flatpak install --system flathub com.github.Matoking.protontricks

# Emulators
flatpak install --system flathub app.xemu.xemu # Xbox 360 Emulator
flatpak install --system flathub com.supermodel3.Supermodel # Sega Model 3 Emulator
flatpak install --system flathub io.github.shiiion.primehack
flatpak install --system flathub net.kuribo64.melonDS # Nintendo DS Emulator
flatpak install --system flathub org.DolphinEmu.dolphin-emu # GameCube and Wii Emulator
flatpak install --system flathub org.duckstation.DuckStation # PlayStation 1 Emulator
flatpak install --system flathub org.libretro.RetroArch # Multi-System Emulator
flatpak install --system flathub org.ppsspp.PPSSPP # PlayStation Portable Emulator
flatpak install --system flathub org.ryujinx.Ryujinx # Nintendo Switch Emulator
flatpak install --system flathub org.scummvm.ScummVM # Adventure Game Interpreter
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

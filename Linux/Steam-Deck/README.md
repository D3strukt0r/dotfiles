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

#### Manual Configuration (CLI)

```bash
flatpak install flathub com.brave.Browser
flatpak install flathub com.spotify.Client
flatpak install flathub com.mastermindzh.tidal-hifi
flatpak install flathub com.protonvpn.www
flatpak install flathub org.localsend.localsend_app
flatpak install flathub com.rustdesk.RustDesk
flatpak install flathub eu.betterbird.Betterbird
flatpak install flathub me.kozec.syncthingtk
flatpak install flathub com.dropbox.Client

# 3D Design
flatpak install flathub com.ultimaker.cura

# Documents
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub com.calibre_ebook.calibre

# Audio & Photo & Video
flatpak install flathub org.audacityteam.Audacity
flatpak install flathub org.videolan.VLC
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub fr.handbrake.ghb
flatpak install flathub org.blender.Blender

# Messaging
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.telegram.desktop
flatpak install flathub org.signal.Signal
flatpak install flathub us.zoom.Zoom
flatpak install flathub com.slack.Slack

# Development
flatpak install flathub com.visualstudio.code
flatpak install flathub io.neovim.nvim

# Gaming
flatpak install flathub com.github.Matoking.protontricks
flatpak install flathub com.usebottles.bottles
flatpak install flathub com.heroicgameslauncher.hgl
flatpak install flathub net.lutris.Lutris
flatpak install flathub net.davidotek.pupgui2 # ProtonUp-Qt

# Emulators
flatpak install flathub org.DolphinEmu.dolphin-emu
flatpak install flathub org.duckstation.DuckStation
flatpak install flathub org.ppsspp.PPSSPP
flatpak install flathub net.kuribo64.melonDS
flatpak install flathub app.xemu.xemu
flatpak install flathub net.pcsx2.PCSX2
flatpak install flathub org.ryujinx.Ryujinx
flatpak install flathub ca.parallel_launcher.ParallelLauncher
```

Emu Deck - [Help Page](https://emudeck.github.io/how-to-install-emudeck/steamos/) - [Download](https://www.emudeck.com/EmuDeck.desktop)

```bash
sh -c 'curl -L https://raw.githubusercontent.com/dragoonDorise/EmuDeck/main/install.sh | bash'
```

Waydroid Installer - [Repository](https://github.com/ryanrudolfoba/SteamOS-Waydroid-Installer)

```bash
cd ~/
git clone --depth=1 https://github.com/ryanrudolfoba/steamos-waydroid-installer
cd ~/steamos-waydroid-installer
chmod +x steamos-waydroid-installer.sh
./steamos-waydroid-installer.sh
```

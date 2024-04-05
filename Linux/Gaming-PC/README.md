# Gaming PC

## Getting Started

### Installing

Install Ubuntu

To be able to use SteamVR properly, you need to to have a desktop that supports DRM leasing (https://help.steampowered.com/en/faqs/view/18A4-1E10-8A94-3DDA) and a Nvidia GPU. Ubuntu's default is Gnome Wayland. Either switch to KDE Plasma with Wayland or use Gnome with X11.

```shell
sudo apt install kde-full kde-plasma-desktop plasma-workspace-wayland
```

To change the display manager later on you can use

```shell
sudo dpkg-reconfigure gdm3
# or
sudo dpkg-reconfigure sddm
```

Clone repository

```sh
git clone https://github.com/D3strukt0r/dotfiles ~/.dotfiles && cd ~/.dotfiles/Linux/Gaming-PC
git remote set-url origin git@github.com:D3strukt0r/dotfiles.git
```

Link files

```shell
mkdir ~/.ssh
ln -s ~/.dotfiles/Linux/Gaming-PC/.ssh/config ~/.ssh/config
ln -s ~/.dotfiles/Linux/Gaming-PC/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/Linux/Gaming-PC/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/Linux/Gaming-PC/.gitmessage ~/.gitmessage
```

Restore GPG from backup and load SSH keys

```shell
# go to gpg backup
gpg --import-options import-restore --import <file>.asc
```

Install tools to make life easier

```shell
sudo apt install wget curl apt-transport-https gpg htop
```

Install VS Code (https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions)

```shell
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update && sudo apt install code
```

Install 1Password (https://support.1password.com/install-linux/#debian-or-ubuntu)

```shell
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password
```

Install Brave (https://brave.com/linux/#debian-ubuntu-mint)

```shell
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install brave-browser
```

Install Steam (https://repo.steampowered.com/steam/)

```shell
sudo curl -fsSLo /usr/share/keyrings/steam.gpg https://repo.steampowered.com/steam/archive/stable/steam.gpg
sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'
deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
EOF
sudo dpkg --add-architecture i386
sudo apt update && sudo apt install libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1-mesa-glx:amd64 libgl1-mesa-glx:i386 steam-launcher
# Then you need to start Steam to finish installation
```

### Installing on Fedora

#### Install VS Code on Fedora

```shell
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code
```

#### Install Gnome Tweaks

```shell
sudo dnf install gnome-tweaks -y
```

Search for `Optimierungen` and open

`Windows` -> `Knöpfe der Titelleiste` and enable `Maximieren` and `Minimieren`.

```shell
flatpak install flathub org.gnome.Extensions
flatpak run org.gnome.Extensions # or search for "Erweiterungen"
```

Activate `Window List` extension. Then enable `Auf allen Bildschirmen anzeigen` in the settings.

#### Install KDE (support DRM leasing, required for SteamVR)

And switchdesk to switch easily between Gnome and KDE

```shell
sudo dnf groupinstall "KDE Plasma Workspaces"
sudo dnf install -y switchdesk switchdesk-gui
switchdesk kde
```

#### Install 1Password on Fedora

```shell
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf check-update -y 1password 1password-cli && sudo dnf install 1password 1password-cli -y
```

#### Install Brave Browser

```shell
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y
```

#### Install Gaming Stuff (Steam)

https://rpmfusion.org/Howto/NVIDIA

```shell
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda

sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:/Maroxy:/AAT-Apps/Fedora_Rawhide/home:Maroxy:AAT-Apps.repo

sudo dnf install -y \
    steam \
    lutris \
    wine \
    an-anime-game-launcher
```

#### Install other tools

```shell
sudo dnf install -y \
    https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2024.01.22-1.fc39.x86_64.rpm \
    python3-gpg
```

# Gaming PC

## Getting Started

### Installing

```sh
git clone https://github.com/D3strukt0r/dotfiles ~/.dotfiles && cd ~/.dotfiles/Linux/Gaming-PC
```

```shell
ln -s ~/.dotfiles/Linux/Gaming-PC/.ssh/config ~/.ssh/config
ln -s ~/.dotfiles/Linux/Gaming-PC/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/Linux/Gaming-PC/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/Linux/Gaming-PC/.gitmessage ~/.gitmessage
```

#### Install VS Code

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

#### Install 1Password

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

Restore GPG

```shell
# go to gpg backup
gpg --import-options import-restore --import <file>.asc
```

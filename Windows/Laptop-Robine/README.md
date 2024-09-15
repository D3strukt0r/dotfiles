# Windows / Laptop Robine

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

TODO: Document how to install Dual-Boot on MacBook with Windows 11

* [Git](https://git-scm.com/)
* [Python](https://www.python.org/downloads/)
* [New Powershell](https://github.com/PowerShell/PowerShell)

```powershell
winget install --id Git.Git --exact --source winget
winget install --id Python.Python.3.12 --exact --source winget
winget install --id Microsoft.PowerShell --exact --source winget
```

### Installing

For first-time setup

```powershell
git clone https://github.com/D3strukt0r/dotfiles "$HOME\.dotfiles" && cd "$HOME\.dotfiles\Windows\Laptop-Robine" && .\install.ps1
```

For getting updates

```powershell
cd "$HOME\.dotfiles\Windows\Laptop-Robine" && git pull && .\install.ps1
```

### Manual Steps

```powershell
winget install --id Microsoft.VisualStudioCode --exact --source winget
winget install --id JanDeDobbeleer.OhMyPosh --exact --source winget
```

Then install the font `Meslo`

```powershell
oh-my-posh font install
```

Install this font in the Windows Terminal settings, by first enabling the feature `Windows Terminal -> Einstellungen -> Rendering -> Verwenden des neuen Textrenderers ("AtlasEngine") (x)` and opening the settings file with `Ctrl + Shift + ,` and adding the following line to the `defaults` section:

```json
{
    "profiles": {
        "defaults": {
            "font": {
                "face": "MesloLGM Nerd Font"
            }
        }
    }
}
```

Link the PowerShell profile

```powershell
Remove-Item -Path $PROFILE
New-Item -ItemType SymbolicLink `
  -Path "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
  -Target "$HOME\.dotfiles\Windows\Laptop-Robine\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
# or if OneDrive is used to sync the Documents folder
New-Item -ItemType SymbolicLink `
  -Path "$HOME\OneDrive\Dokumente\PowerShell\Microsoft.PowerShell_profile.ps1" `
  -Target "$HOME\.dotfiles\Windows\Laptop-Robine\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Then reload the profile

```powershell
. $PROFILE
```

Link the Git config

```powershell
Remove-Item -Recurse -Path "$HOME\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$HOME\.dotfiles\Windows\Laptop-Robine\.gitconfig"
```

Link the ssh config

```powershell
Remove-Item -Recurse -Path "$HOME\.ssh\config"
New-Item -ItemType SymbolicLink -Path "$HOME\.ssh\config" -Target "$HOME\.dotfiles\Windows\Laptop-Robine\.ssh\config"
```

To ignore hash not matching run ([StackOverflow](https://stackoverflow.com/questions/75647313/winget-install-my-app-receives-installer-hash-does-not-match))

```powershell
winget settings --enable InstallerHashOverride
```

Now install the rest of the packages

```powershell
winget install --id AgileBits.1Password --exact --source winget
winget install --id 7zip.7zip --exact --source winget
winget install --name "Affinity Photo 2" --exact --source msstore
winget install --name "Affinity Designer 2" --exact --source msstore
winget install --id Audacity.Audacity --exact --source winget
winget install --id BlenderFoundation.Blender --exact --source winget
winget install --id Brave.Brave --exact --source winget
winget install --name "Adobe Creative Cloud" --exact --source msstore
winget install --id Adobe.Acrobat.Reader.64-bit --exact --source winget
winget install --id Discord.Discord --exact --source winget
winget install --id Dropbox.Dropbox --exact --source winget
winget install --id File-New-Project.EarTrumpet --exact --source winget
winget install --id SomePythonThings.ElevenClock --exact --source winget
winget install --id flux.flux --exact --source winget # Often has has mismatch because file has no version
winget install --id Figma.Figma --exact --source winget
winget install --id HandBrake.HandBrake --exact --source winget
# Requires
# - Microsoft.DotNet.DesktopRuntime.8
winget install --id REALiX.HWiNFO --exact --source winget
winget install --id Logitech.GHUB --exact --source winget
winget install --id Skillbrains.Lightshot --exact --source winget
winget install --id Microsoft.Office --exact --source winget
winget install --id Notion.Notion --exact --source winget
winget install --id PrivateInternetAccess.PrivateInternetAccess --exact --source winget
winget install --id Microsoft.PowerToys --exact --source winget
winget install --id Proton.ProtonMailBridge --exact --source winget
winget install --id OpenWhisperSystems.Signal --exact --source winget
winget install --id SlackTechnologies.Slack --exact --source winget
winget install --id Telegram.TelegramDesktop --exact --source winget
winget install --id Mozilla.Thunderbird --exact --source winget
winget install --id Microsoft.VisualStudio.2022.Community --exact --source winget
winget install --id Unity.UnityHub --exact --source winget
winget install --id VideoLAN.VLC --exact --source winget
winget install --id WinSCP.WinSCP --exact --source winget
winget install --id Xencelabs.Driver --exact --source winget
winget install --id Zoom.Zoom --exact --source winget
winget install --id Rufus.Rufus --exact --source winget
winget install --id Balena.Etcher --exact --source winget

# 3D Printing
winget install --id Ultimaker.Cura --exact --source winget

# Games
winget install --id Valve.Steam --exact --source winget
winget install --id EpicGames.EpicGamesLauncher --exact --source winget
# Install Genshin Impact on Epic Games
# Install Rocket League on Epic Games
winget install --id Peppy.Osu! --exact --source winget
winget install --id Mojang.MinecraftLauncher --exact --source winget

# Development Tools
winget install --id JetBrains.Toolbox --exact --source winget
# Install Android Studio on JetBrains Hub
# Install PhpStorm on JetBrains Hub
winget install --id Docker.DockerDesktop --exact --source winget
winget install --id Hashicorp.Vagrant --exact --source winget
winget install --id Oracle.VirtualBox --exact --source winget
winget install --id FiloSottile.mkcert --exact --source winget
winget install --id Axosoft.GitKraken --exact --source winget
winget install --id GnuPG.Gpg4win --exact --source winget
# Restore GPG keys from backup
winget install --id CoreyButler.NVMforWindows --exact --source winget
winget install --id Oracle.JDK.21 --exact --source winget

# Reload PATH then (https://stackoverflow.com/a/31845512)
nvm install lts
nvm use lts

# And install mkcert
mkcert -install

# Install vagrant plugins
vagrant plugin install vagrant-hostsupdater vagrant-notify-forwarder vagrant-gatling-rsync vagrant-vbguest

# To allow permanent access to the hosts file (https://github.com/agiledivider/vagrant-hostsupdater?tab=readme-ov-file#windows-uac-prompt) (Does not work in PowerShell must be in CMD as Administrator)
cacls %SYSTEMROOT%\system32\drivers\etc\hosts /E /G %USERNAME%:W

# Install games from Steam (Login to steam before doing this). Do each command one by one, needs confirmation in Steam client
# Find the AppID on https://steamdb.info/search/
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","431960" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Wallpaper Engine

# Package managers (Chocolatey / Scoop)
winget install --id Chocolatey.Chocolatey --exact --source winget
winget install --id Chocolatey.ChocolateyGUI --exact --source winget
iwr -useb get.scoop.sh | iex
scoop bucket add extras
```

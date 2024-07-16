# Windows / Gaming PC

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

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
git clone https://github.com/D3strukt0r/dotfiles "$HOME\.dotfiles" && cd "$HOME\.dotfiles\Windows\Gaming-PC" && .\install.ps1
```

For getting updates

```powershell
cd "$HOME\.dotfiles\Windows\Gaming-PC" && git pull && .\install.ps1
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
  -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
# or if OneDrive is used to sync the Documents folder
New-Item -ItemType SymbolicLink `
  -Path "$HOME\OneDrive\Dokumente\PowerShell\Microsoft.PowerShell_profile.ps1" `
  -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Then reload the profile

```powershell
. $PROFILE
```

Link the Git config

```powershell
Remove-Item -Recurse -Path "$HOME\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$HOME\.dotfiles\Windows\Gaming-PC\.gitconfig"
```

Link the ssh config

```powershell
Remove-Item -Recurse -Path "$HOME\.ssh\config"
New-Item -ItemType SymbolicLink -Path "$HOME\.ssh\config" -Target "$HOME\.dotfiles\Windows\Gaming-PC\.ssh\config"
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
winget install --id Elgato.ControlCenter --exact --source winget
winget install --id Discord.Discord --exact --source winget
winget install --id Dropbox.Dropbox --exact --source winget
winget install --id flux.flux --exact --source winget # Often has has mismatch because file has no version
winget install --id Figma.Figma --exact --source winget
winget install --id Nvidia.Broadcast --exact --source winget # Will continue download while installing
winget install --id HandBrake.HandBrake --exact --source winget # Requires .NET 6.0
winget install --id REALiX.HWiNFO --exact --source winget
winget install --id Skillbrains.Lightshot --exact --source winget
winget install --id Microsoft.Office --exact --source winget
winget install --id Guru3D.Afterburner --exact --source winget
winget install --id MSI.Kombustor.4 --exact --source winget # TODO: Fix hash mismatch
winget install --id Notion.Notion --exact --source winget
winget install --id OBSProject.OBSStudio --exact --source winget # Requires  Microsoft.VCRedist.2015+.x64
winget install --id PrivateInternetAccess.PrivateInternetAccess --exact --source winget
winget install --id Proton.ProtonVPN --exact --source winget
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
winget install --id Zoom.Zoom --exact --source winget
winget install --id Rufus.Rufus --exact --source winget
winget install --id Balena.Etcher --exact --source winget
winget install --id LocalSend.LocalSend --exact --source winget

# Drivers & Control
winget install --id Nvidia.GeForceExperience --exact --source winget
# winget install --id Corsair.iCUE.5 --exact --source winget # Takes a moment to show up, maybe restart Windows
# Don't install iCUE from winget, it's kinda broken, program doesn't exist?? Use https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe
winget install --id Intel.IntelDriverAndSupportAssistant --exact --source winget
winget install --id Logitech.GHUB --exact --source winget
winget install --id LianLi.LConnect3 --exact --source winget
winget install --id RazerInc.RazerInstaller --exact --source winget
winget install --id SteelSeries.GG --exact --source winget
winget install --id Elgato.StreamDeck --exact --source winget
# Requires
# - Microsoft.VCRedist.2015+.x64
winget install --id Xencelabs.Driver --exact --source winget
winget install --id Rem0o.FanControl --exact --source winget

# PC Tools
winget install --id File-New-Project.EarTrumpet --exact --source winget
winget install --id SomePythonThings.ElevenClock --exact --source winget
winget install --id Levitsky.FontBase --exact --source winget

# Crypto
winget install --id LedgerHQ.LedgerLive --exact --source winget

# 3D Printing
winget install --id Ultimaker.Cura --exact --source winget

# Games
winget install --id Ryochan7.DS4Windows --exact --source winget
# Requires:
# - Microsoft.VCRedist.2015+.x64
# - Microsoft.DotNet.DesktopRuntime.8
# - ViGEm.ViGEmBus
# - ViGEm.HidHide
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
winget install --id Postman.Postman --exact --source winget
winget install --id Rustlang.Rustup --exact --source winget

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

# VR Games
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","250820" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # SteamVR
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","1635730" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # VIVE Console for SteamVR
# Install Vive Wireless from: "https://dl.vive.com/oobe/ViveWireless/ViveWirelessSetup.exe", waiting for https://github.com/microsoft/winget-pkgs/issues/138203
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","620980" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Beat Saber
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","348250" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Google Earth VR
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","341800" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Keep Talking and Nobody Explodes
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","275850" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # No Man's Sky
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","617830" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # SUPERHOT VR
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","868150" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Takelings House Party
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","438100" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # VRChat

# Link (and overwrite if already exists) FanControl config (Admin only)
New-Item -ItemType Directory -Force -Path "C:\Program Files (x86)\FanControl\Configurations"
$target = "C:\Program Files (x86)\FanControl\Configurations\userConfig.json"
if (Test-Path -Path $target) { Remove-Item -Recurse -Path $target }
New-Item -ItemType SymbolicLink -Path $target -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\FanControl\userConfig.json"

# Package managers (Chocolatey / Scoop)
winget install --id Chocolatey.Chocolatey --exact --source winget
winget install --id Chocolatey.ChocolateyGUI --exact --source winget
iwr -useb get.scoop.sh | iex
scoop bucket add extras
```

Manually install the following packages

* [GoXLR App](https://www.tc-helicon.com/downloads.html) - <https://mediadl.musictribe.com/download/software/tchelicon/GoXLR/app/GoXLR%20App%20V1.6.4.013.exe>
* [GoXLR Driver](https://www.tc-helicon.com/product.html?modelCode=0803-AAB) - <https://mediadl.musictribe.com/download/software/tchelicon/GoXLR/TC-Helicon_GoXLR_Driver.zip>

Manually Configure

* Add `Titillium Web` font in FontBase

#### Usage of `packages.config`

Install

Dump currently installed packages

```powershell
choco export
```

See <https://github.com/ScoopInstaller/Scoop/issues/1543>

```powershell
(scoop list) | sls '^  (\w+)' |% { $_.matches.groups[1].value } > scoop-apps.txt
# or
scoop export | out-file scoop-apps.json -encoding ascii
```

Install all packages from `packages.config`

```powershell
choco install packages.config
```

```powershell
$apps = gc scoop-apps.json
scoop install @apps
```

#### Link (Inside PowerShell as Administrator)

#### GoXLR

```powershell
Remove-Item -Recurse -Path "$HOME\Documents\GoXLR\MicProfiles"
Remove-Item -Recurse -Path "$HOME\Documents\GoXLR\Profiles"
New-Item -ItemType SymbolicLink `
  -Path "$HOME\Documents\GoXLR\MicProfiles" `
  -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\GoXLR\MicProfiles"
New-Item -ItemType SymbolicLink `
  -Path "$HOME\Documents\GoXLR\Profiles" `
  -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\GoXLR\Profiles"
# or if OneDrive is used to sync the Documents folder
Remove-Item -Recurse -Path "$HOME\OneDrive\Dokumente\GoXLR\MicProfiles"
Remove-Item -Recurse -Path "$HOME\OneDrive\Dokumente\GoXLR\Profiles"
New-Item -ItemType SymbolicLink `
  -Path "$HOME\OneDrive\Dokumente\GoXLR\MicProfiles" `
  -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\GoXLR\MicProfiles"
New-Item -ItemType SymbolicLink `
  -Path "$HOME\OneDrive\Dokumente\GoXLR\Profiles" `
  -Target "$HOME\.dotfiles\Windows\Gaming-PC\Documents\GoXLR\Profiles"
```

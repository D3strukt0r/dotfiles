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
winget install --id Docker.DockerDesktop --exact --source winget
winget install --id Dropbox.Dropbox --exact --source winget
winget install --id File-New-Project.EarTrumpet --exact --source winget
winget install --id SomePythonThings.ElevenClock --exact --source winget
winget install --id EpicGames.EpicGamesLauncher --exact --source winget
# Install Genshin Impact on Epic Games
# Install Rocket League on Epic Games
# As Admin only the following command:
winget settings --enable InstallerHashOverride
winget install --id flux.flux --ignore-security-hash --exact --source winget
winget settings --disable InstallerHashOverride
winget install --id Figma.Figma --exact --source winget
winget install --id Nvidia.GeForceExperience --exact --source winget
winget install --id Nvidia.Broadcast --exact --source winget # Not there?
winget install --id Axosoft.GitKraken --exact --source winget
winget install --id GnuPG.Gpg4win --exact --source winget
# Restore GPG keys from backup
winget install --id HandBrake.HandBrake --exact --source winget # Requires .NET 6.0
winget install --id REALiX.HWiNFO --exact --source winget
winget install --id Corsair.iCUE.5 --exact --source winget # Takes a moment to show up, maybe restart Windows
winget install --id Intel.IntelDriverAndSupportAssistant --exact --source winget
winget install --id JetBrains.Toolbox --exact --source winget
# Install Android Studio on JetBrains Hub
# Install PhpStorm on JetBrains Hub
winget install --id Oracle.JDK.21 --exact --source winget
winget install --id Logitech.GHUB --exact --source winget
winget install --id LianLi.LConnect3 --exact --source winget
winget install --id Skillbrains.Lightshot --exact --source winget
winget install --id Mojang.MinecraftLauncher --exact --source winget
winget install --id CoreyButler.NVMforWindows --exact --source winget
nvm install lts
nvm use 20.11.0 # or whatever the latest LTS is
winget install --id Guru3D.Afterburner --exact --source winget
winget install --id MSI.Kombustor.4 --exact --source winget
winget install --id Notion.Notion --exact --source winget
winget install --id OBSProject.OBSStudio --exact --source winget # Requires  Microsoft.VCRedist.2015+.x64
winget install --id Peppy.Osu! --exact --source winget
winget install --id PrivateInternetAccess.PrivateInternetAccess --exact --source winget
winget install --id Microsoft.PowerToys --exact --source winget
winget install --id ProtonTechnologies.ProtonMailBridge --exact --source winget
winget install --id RazerInc.RazerInstaller --exact --source winget
winget install --id OpenWhisperSystems.Signal --exact --source winget
winget install --id SlackTechnologies.Slack --exact --source winget
winget install --id Valve.Steam --exact --source winget
# Install Wallpaper Engine on Steam
# Install games on Steam
winget install --id SteelSeries.GG --exact --source winget
winget install --id Elgato.StreamDeck --exact --source winget # Requires Microsoft.VCRedist.2015+.x64
winget install --id Telegram.TelegramDesktop --exact --source winget
winget install --id Mozilla.Thunderbird --exact --source winget
winget install --id Unity.UnityHub --exact --source winget
winget install --id VideoLAN.VLC --exact --source winget
winget install --id WinSCP.WinSCP --exact --source winget
winget install --id Zoom.Zoom --exact --source winget
```

### Old Method Choco / Scoop

* Chocolatey - Download on <https://chocolatey.org/install> or run `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
* Scoop - Download on <https://scoop.sh> or run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` and `irm get.scoop.sh | iex`

#### Usage of `packages.config`

Install

Dump currently installed packages

```sh
choco export
```

See <https://github.com/ScoopInstaller/Scoop/issues/1543>

```sh
(scoop list) | sls '^  (\w+)' |% { $_.matches.groups[1].value } > scoop-apps.txt
# or
scoop export | out-file scoop-apps.json -encoding ascii
```

Install all packages from `packages.config`

```sh
choco install packages.config
```

```sh
$apps = gc scoop-apps.txt
scoop install @apps
```

#### Link (Inside PowerShell as Administrator)

#### GoXLR

```powershell
Remove-Item -Recurse -Path "$HOME\Documents\GoXLR\MicProfiles"
Remove-Item -Recurse -Path "$HOME\Documents\GoXLR\Profiles"
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\GoXLR\MicProfiles" -Target "$HOME\.dotfiles\GoXLR\MicProfiles"
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\GoXLR\Profiles" -Target "$HOME\.dotfiles\GoXLR\Profiles"
```

##### Fan Control

```powershell
Remove-Item -Recurse -Path "$HOME\scoop\apps\fancontrol\current\userConfig.json"
New-Item -ItemType SymbolicLink -Path "$HOME\scoop\apps\fancontrol\current\userConfig.json" -Target "$HOME\.dotfiles\FanControl\userConfig.json"
# or
Remove-Item -Recurse -Path "C:\Apps\FanControl\Configurations\userConfig.json"
New-Item -ItemType SymbolicLink -Path "C:\Apps\FanControl\Configurations\userConfig.json" -Target "$HOME\.dotfiles\FanControl\userConfig.json"
```

# Windows / Robines PC

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
git clone https://github.com/D3strukt0r/dotfiles "$HOME\.dotfiles" && cd "$HOME\.dotfiles\Windows\Robines-PC" && .\install.ps1
```

For getting updates

```powershell
cd "$HOME\.dotfiles\Windows\Robines-PC" && git pull && .\install.ps1
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

Then reload the profile

```powershell
. $PROFILE
```

Link the Git config

```powershell
Remove-Item -Recurse -Path "$HOME\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$HOME\.dotfiles\Windows\Robines-PC\.gitconfig"
```

Link the ssh config

```powershell
Remove-Item -Recurse -Path "$HOME\.ssh\config"
New-Item -ItemType SymbolicLink -Path "$HOME\.ssh\config" -Target "$HOME\.dotfiles\Windows\Robines-PC\.ssh\config"
```

To ignore hash not matching run ([StackOverflow](https://stackoverflow.com/questions/75647313/winget-install-my-app-receives-installer-hash-does-not-match))

```powershell
winget settings --enable InstallerHashOverride
```

in an administrator terminal and append `--ignore-security-hash` to any `winget install ...` command

Now install the rest of the packages

```powershell
winget install --id AgileBits.1Password --exact --source winget
winget install --id 7zip.7zip --exact --source winget
winget install --name "Affinity Photo 2" --exact --source msstore
winget install --name "Affinity Designer 2" --exact --source msstore
winget install --name "Affinity Publisher 2" --exact --source msstore
winget install --id Audacity.Audacity --exact --source winget
winget install --id BlenderFoundation.Blender --exact --source winget
winget install --id Mozilla.Firefox --exact --source winget
winget install --id Brave.Brave --exact --source winget
winget install --name "Adobe Creative Cloud" --exact --source msstore
winget install --id Discord.Discord --exact --source winget
winget install --id flux.flux --exact --source winget # Often has has mismatch because file has no version
winget install --id Figma.Figma --exact --source winget
winget install --id HandBrake.HandBrake --exact --source winget
# Requires
# - Microsoft.DotNet.DesktopRuntime.8
winget install --id REALiX.HWiNFO --exact --source winget
winget install --id Skillbrains.Lightshot --exact --source winget
winget install --id Microsoft.Office --exact --source winget
winget install --id Notion.Notion --exact --source winget
winget install --id OBSProject.OBSStudio --exact --source winget
# Requires
# - Microsoft.VCRedist.2015+.x64
winget install --id Proton.ProtonVPN --exact --source winget
winget install --id Microsoft.PowerToys --exact --source winget
winget install --id OpenWhisperSystems.Signal --exact --source winget
winget install --id VideoLAN.VLC --exact --source winget
winget install --id Zoom.Zoom --exact --source winget
winget install --id LocalSend.LocalSend --exact --source winget
winget install --id TeamViewer.TeamViewer --exact --source winget

# Drivers & Control
winget install --id Nvidia.GeForceExperience --exact --source winget
# winget install --id Corsair.iCUE.5 --exact --source winget # Takes a moment to show up, maybe restart Windows
# Don't install iCUE from winget, it's kinda broken, program doesn't exist?? Use 
# -> https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe
winget install --id Logitech.OptionsPlus --exact --source winget
# For ASUS PCE-AXE58BT (https://www.asus.com/networking-iot-servers/adapters/all-series/pce-axe58bt/helpdesk_download?model2Name=PCE-AXE58BT)
# -> https://dlcdnets.asus.com/pub/ASUS/wireless/PCE-AXE58BT/DR_PCE-AXE58BT_v1.0.0.5.zip?model=PCE-AXE58BT


# PC Tools
winget install --id SomePythonThings.ElevenClock --exact --source winget

# Games
winget install --id Valve.Steam --exact --source winget
winget install --id EpicGames.EpicGamesLauncher --exact --source winget
winget install --id Ubisoft.Connect --exact --source winget # or https://static3.cdn.ubi.com/orbit/launcher_installer/UbisoftConnectInstaller.exe
# Install Genshin Impact on Epic Games
# Install KINGDOM HEARTS HD 1.5+2.5 ReMIX on Epic Games
# Install KINGDOM HEARTS III + Re Mind on Epic Games
winget install --id Mojang.MinecraftLauncher --exact --source winget

# Development Tools
winget install --id GnuPG.Gpg4win --exact --source winget
# Restore GPG keys from backup

# Install games from Steam (Login to steam before doing this). Do each command one by one, needs confirmation in Steam client
# Find the AppID on https://steamdb.info/search/
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","431960" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Wallpaper Engine

Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","1332010" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Stray
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","2660090" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # PuffPals: Island Skies Alpha Playtest
Start-Process -FilePath ".\steam.exe" -ArgumentList "-applaunch","638230" -WorkingDirectory "${Env:Programfiles(x86)}\Steam\" -Wait # Journey
```

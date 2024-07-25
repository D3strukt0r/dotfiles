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
winget install --id 9P8DVF1XW02V --exact --source msstore # Affinity Photo 2
winget install --id 9N2D0P16C80H --exact --source msstore # Affinity Designer 2
winget install --id 9NTV2DZ11KD9 --exact --source msstore # Affinity Publisher 2
winget install --id Audacity.Audacity --exact --source winget
winget install --id BlenderFoundation.Blender --exact --source winget
winget install --id Mozilla.Firefox --exact --source winget
winget install --id Brave.Brave --exact --source winget
winget install --id Google.Chrome --exact --source winget
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
winget install --id DeepL.DeepL --exact --source winget
winget install --id 9WZDNCRFJ3B4 --exact --source msstore # JW Library
winget install --id Spotify.Spotify --exact --source winget
winget install --id 9NKSQGP7F2NH --exact --source msstore # WhatsApp
winget install --id Grammarly.Grammarly --exact --source winget
# VERO
# -> https://brand.vero.co/vero-desktop-beta
# -> https://downloads.vero.co/vero-beta-0.12.1736.exe
winget install --id XPDP32QDDFL4PK --exact --source msstore # CLIP STUDIO PAINT
winget install --id XP8BSML4BXT27N --exact --source msstore # Descript
winget install --id 9WZDNCRDR0SF --exact --source msstore # One Calendar
winget install --id 9NBLGGH2JHRG --exact --source msstore # One Task
winget install --id Apple.iTunes --exact --source winget
winget install --id ImageLine.FLStudio --exact --source winget # Also installs MichaelTippach.ASIO4ALL
winget install --id NVAccess.NVDA --exact --source winget
# PaintTools SAI
# -> https://www.systemax.jp/en/sai/
# -> https://www.systemax.jp/bin/sai-1.2.5-ful-en.exe
winget install --id 9NLRL58VZCK9 --exact --source msstore # Hue Essentials
# TODO: Figure out why Hue Essentials throws "Failed to launch JVM"
# BERNINA Creator 9 (TODO: Actually use USB Stick)
# -> https://www.bernina.com/de-CH/Software-CH/Sticksoftware/BERNINA-Sticksoftware-9/BERNINA-Sticksoftware-9-%E2%80%93-Creator
# -> https://cdn.bernina.com/download/BERNINA_Embroidery_Software_V9/BERNINAEmbroiderySoftware_V9_2_Jun2024_Creator_24_1_266_20177.zip
# AEJuice Pack Manager
# -> https://aejuice.com/checkout/order-received/free-plugins/?email=unknown@gmail.com
# -> https://aejuice.com/pack_manager/AEJuice_Pack_Manager.zip

# Drivers & Control
winget install --id Asus.ArmouryCrate --exact --source winget
winget install --id Nvidia.GeForceExperience --exact --source winget
# winget install --id Corsair.iCUE.5 --exact --source winget # Takes a moment to show up, maybe restart Windows
# Don't install iCUE from winget, it's kinda broken, program doesn't exist?? Use 
# -> https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe
winget install --id Logitech.OptionsPlus --exact --source winget
# For ASUS PCE-AXE58BT
# -> https://www.asus.com/networking-iot-servers/adapters/all-series/pce-axe58bt/helpdesk_download?model2Name=PCE-AXE58BT
# -> https://dlcdnets.asus.com/pub/ASUS/wireless/PCE-AXE58BT/DR_PCE-AXE58BT_v1.0.0.5.zip?model=PCE-AXE58BT
# winget install --id Samsung.SamsungMagician --exact --source winget # For Samsung Magician, the package was removed (https://github.com/microsoft/winget-pkgs/pull/164032) use:
# -> https://semiconductor.samsung.com/consumer-storage/support/tools/
# -> https://download.semiconductor.samsung.com/resources/software-resources/Samsung_Magician_Installer_Official_8.1.0.800.exe
winget install --id Wacom.WacomTabletDriver --exact --source winget
# Canon G6050 Drivers
# -> https://de.canon.ch/support/consumer/products/printers/pixma/g-series/pixma-g6050.html?type=drivers&os=Windows%2011
# -> https://gdlp01.c-wss.com/gds/6/0100010246/03/win-g6000-1_3-n_mcd.exe

# PC Tools
winget install --id SomePythonThings.ElevenClock --exact --source winget

# Games
winget install --id Valve.Steam --exact --source winget
winget install --id EpicGames.EpicGamesLauncher --exact --source winget
winget install --id DeSmuMETeam.DeSmuME --exact --source winget
# Requires
# - Microsoft.VCRedist.2015+.x64
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

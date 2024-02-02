# dotfiles

My personal dotfiles

Project

[![License](https://img.shields.io/github/license/d3strukt0r/dotfiles)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](CODE_OF_CONDUCT.md)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Chocolatey - Download on <https://chocolatey.org/install> or run `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
* Scoop - Download on <https://scoop.sh> or run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` and `irm get.scoop.sh | iex`
* Git - Download on <https://git-scm.com/> or run `choco install git`
* Python - Download on <https://www.python.org/downloads/> or run `choco install python`

### Installing

For first-time setup

```powershell
git clone https://github.com/D3strukt0r/dotfiles "$HOME\.dotfiles" && cd "$HOME\.dotfiles" && .\install.ps1
```

For getting updates

```powershell
cd "$HOME\.dotfiles" && git pull && .\install.ps1
```

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

##### Git

```powershell
Remove-Item -Recurse -Path "$HOME\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$HOME\.gitconfig" -Target "$HOME\.dotfiles\gitconfig"
```

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

## Built With

Nothing needed

## Contributing

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct, and [CONTRIBUTING.md](CONTRIBUTING.md) for the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository][gh-tags].

## Authors

All the authors can be seen in the [AUTHORS.md](AUTHORS.md) file.

Contributors can be seen in the [CONTRIBUTORS.md](CONTRIBUTORS.md) file.

See also the full list of [contributors][gh-contributors] who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details

## Acknowledgments

A list of used libraries and code with their licenses can be seen in the [ACKNOWLEDGMENTS.md](ACKNOWLEDGMENTS.md) file.

[gh-tags]: https://github.com/D3strukt0r/dotfiles/tags
[gh-contributors]: https://github.com/D3strukt0r/dotfiles/contributors

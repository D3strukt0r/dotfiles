# dotfiles

My personal dotfiles

Project

[![License](https://img.shields.io/github/license/d3strukt0r/dotfiles)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.0-4baaaa.svg)](CODE_OF_CONDUCT.md)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Git - Download on <https://git-scm.com/> or run `brew install git` on macOS

### Installing

For first time setup

```sh
git clone https://github.com/D3strukt0r/dotfiles ~/.dotfiles && cd ~/.dotfiles && ./install
```

For getting updates

```sh
cd ~/.dotfiles && git pull && ./install
```

#### Usage of "Brewfile"

Install

```sh
brew tap homebrew/bundle
```

Dump currently installed packages

```sh
brew bundle dump -f
```

Install all packages from `Brewfile`

```sh
brew bundle
```

Remove all packages not mentioned in `Brewfile`

```sh
brew bundle cleanup
```

#### antigen

```sh
antigen update
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

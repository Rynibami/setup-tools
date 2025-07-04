# Setup Tools

This repository contains various setup scripts and configurations in order to streamline the setup process for a new MacOS environment. Understanding the structure and purpose of each file will help you customize your setup to fit your needs.

1. [Setup](#setup)
2. [Overview](#overview)
3. [Maintenance](#maintenance)
4. [Contributng](#contributing)
5. [Support](#support)

## Setup

Just running the `setup.sh` script will execute all the necessary setup steps for your MacOS environment, id est:

```sh
./setup.sh
```

## Overview

The codebase is organized into the following structure:

```txt
.
├── .dotfiles
│   ├── .dotter
│   │   └── global.toml
│   ├── bin
│   ├── brewfile
│   ├── starship
│   └── terminal
├── setup.brewfile.sh
├── setup.macos.sh
└── setup.sh
```

This structure has two main components:

* The **global setup scripts** (`setup.brewfile.sh`, `setup.macos.sh`, and `setup.sh`) that automate the installation and configuration of various tools and settings, and
* The `.dotfiles` directory which contains configuration files and scripts for the operating system and various tools.

The setup scripts are designed to be run without having to modify them, allowing for a consistent setup experience across different machines. The scripts are short, written in plain `bash` and include comments to explain their purpose and functionality.

The `.dotfiles` directory, however, is meant to be customized by the user. It contains configuration files for various tools and applications, such as the terminal (see `starship`, `terminal`) and `brewfile`. These files can be edited to suit your preferences and needs.

The current setup uses [`Dotter`](https://github.com/SuperCuber/dotter) for managing a global [`TOML`](https://toml.io) dotfiles configuration (see [`global.toml`](.dotfiles/.dotter/global.toml)). This file defines all (dot)files that will be copied or symbolically linked to their desired location(s), such that you can easily manage a setup across different machines without having to do most of the work manually. For more information on how to use `Dotter`, please visit the [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki).

## Roadmap

There are several features and improvements for this project that might be interesting to implement in the (distant) future. Some of these include:

- [ ] General improvements, such as:
  - [ ] Update the configs to support multiple operating systems (e.g., `Linux`, `Windows`, etc.)
  - [ ] Adding support for more package managers (e.g., `apt`, `yum`, etc.)
  - [ ] Adding support for more tools and applications

- [ ] Documentation improvements, such as:
  - [ ] Adding examples and explanations in the README
  - [ ] Explain that starship is used as the terminal prompt and how to customize it
  - [ ] Explain that dotter supports a local configuration file (`local.toml`)
  - [ ] Adding more comments to the code

- [ ] Setup scripts improvements, such as:
  - [ ] Adding more options to the setup scripts (e.g., `--dry-run`, `--verbose`, etc.)
  - [ ] Making the setup scripts more robust and error-tolerant

## Maintenance

This project is maintained, but not actively developed as it is a personal project that serves as a template for setting up my personal MacOS environment(s). If you have any questions or need assistance, feel free to open an issue / discussion. It would be awesome to see this project grow and evolve with contributions from the community.

## Contributing

If you would like to contribute to this project, please feel free to open a pull request. Contributions are welcome and appreciated! Before submitting a pull request, please ensure that your changes are well-documented and tested.

## Support

If there are people who would like to support me and/or this project, please consider starring the repository on `GitHub`. This helps to raise awareness and encourages others to contribute as well.

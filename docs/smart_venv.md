# Smart venv

## Description

This Bash script provides a comprehensive set of utilities to manage Python virtual environments on a Unix-like system. It facilitates the creation, activation, deactivation, and removal of virtual environments. Additional features include the installation of dependencies, checking installed package versions, disk usage analysis of the environment, and displaying relevant environment variables.

## Features

- **Environment Creation**: Quickly create a new virtual environment in a specified directory.
- **Activation/Deactivation**: Easily activate or deactivate environments.
- **Removal of Environments**: Safely remove existing environments with confirmation prompts.
- **Dependency Management**: Install requirements from a `requirements.txt` file within the active environment.
- **Version Management**: List versions of all installed packages in the active environment.
- **Disk Usage Analysis**: Check the disk space used by the environment, particularly in the site-packages directory.
- **Environment Variable Display**: Show environment variables related to the virtual environment.

## Pre-requisite

- Unix-like operating system (Linux, macOS)
- Python 3.x installed
- Bash shell

## Setup

To use this script, ensure you have Python and Bash installed on your system. Download or copy the script into a desired directory, and ensure it has executable permissions:

```bash
chmod +x tools/smart_venv.sh
```
Optionally, you can copy it in /usr/share/bin/ to be available everytime you open a shell
```bash
cp -vfr tools/smart_venv.sh /usr/share/bin
```

## Configuration

No specific initial configuration required, but ensure the `VENV_PATH` variable in the script is set to your desired directory for storing virtual environments.

## Usage

Run the script using:

```bash
./tools/smart_venv.sh
```

You will be presented with a menu to select from the following options:

1. **Create Virtual Environment**: Initialize a new environment.
2. **Activate Virtual Environment**: Activate the specified environment.
3. **Deactivate Virtual Environment**: Deactivate the current environment.
4. **Remove Virtual Environment**: Permanently delete the specified environment.
5. **Install Requirements**: Install packages from `requirements.txt`.
6. **Get Package Versions**: Display the versions of all installed packages.
7. **Check Disk Usage**: Show disk usage of the virtual environment's site-packages.
8. **Display Environment Variables**: List all environment variables associated with the virtual environment.

Select an option by entering the corresponding number.

## Advanced

Future enhancements could include:

- Support for managing environments in Windows using batch files or PowerShell scripts.
- Adding a feature to update all installed packages to their latest versions.
- Implementing a backup feature for virtual environments before making significant changes.
# Bash Alias Manager

## Description

This bash script simplifies the management of command-line aliases, specifically designed to streamline common tasks such as Git operations, package management, service management, and Docker commands. The script automatically adds a predefined set of useful aliases into the user's `.bashrc` file if they are not already present, ensuring that each session can benefit from these shortcuts without manual configuration.

## Features

- **Comprehensive alias definitions**: Includes aliases for Git, package management (APT), Docker, and systemd service commands.
- **Duplicate check**: Before adding an alias, it checks if the alias already exists to prevent duplication in `.bashrc`.
- **Automatic sourcing**: Automatically sources the `.bashrc` file after updating to make aliases available immediately.

## Pre-requisite

- Bash shell environment.
- Access to `.bashrc` in the user's home directory.
- Necessary permissions to modify `.bashrc`.

## Setup

1. Copy the script into a file, for example, `alias_manager.sh`.
2. Grant executable permissions to the script:
   ```bash
   chmod +x alias_manager.sh
   ```

## Configuration

The script is pre-configured with a variety of useful aliases. Users can modify the `custom_aliases` array within the script to add new aliases or adjust existing ones based on personal preferences or specific needs.

## Usage

Execute the script from the terminal to add or update aliases in your `.bashrc`:
```bash
./alias_manager.sh
```
Upon running, the script will:
- Check if each alias from the predefined list exists in `.bashrc`.
- Add missing aliases to `.bashrc`.
- Notify the user of any aliases that are already present and hence not duplicated.
- Reload `.bashrc` to apply changes immediately.

## Advanced

Future improvements could include:
- Implementing a user interface to manage aliases interactively.
- Adding functionality to remove or edit existing aliases directly through the script.
- Extending support to other shell configuration files like `.zshrc` or `.profile` for users with different shell preferences.
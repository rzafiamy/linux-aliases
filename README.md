# linux-aliases

# Aliases

List of usefull linux aliases

## Git

```bash
alias gi-s='git status'
alias gi-a='git add'
alias gi-c='git commit'
alias gi-co='git checkout'
alias gi-b='git branch'
alias gi-l='git log'
alias gi-d='git diff'
alias gi-dc='git diff --cached'
alias gi-r='git remote -v'
```

## Packages

```bash
alias pa-apt='sudo apt'
alias pa-update='sudo apt update'
alias pa-upgrade='sudo apt upgrade'
alias pa-install='sudo apt install'
alias pa-remove='sudo apt remove'
alias pa-upgradable='sudo apt list --upgradable'
alias pa-search='sudo apt-cache search'
```

## Services

```bash
alias se-services='sudo netstat -nutelap'
```

## Docker

```bash
alias do-cls='docker ps -a'
alias do-clr='docker ps'
alias do-ils='docker images'
alias do-ip='docker pull'
alias do-rmc='docker rm'
alias do-rmi='docker rmi'
alias do-st='docker start'
alias do-stop='docker stop'
alias do-ins='docker inspect'
alias do-run='docker run -it'
alias do-cup='docker-compose up'
alias do-cwn='docker-compose down'
```

## Systemd

```bash
alias sy-start='sudo systemctl start'
alias sy-stop='sudo systemctl stop'
alias sy-restart='sudo systemctl restart'
alias sy-reloads='sudo systemctl reload'
alias sy-enables='sudo systemctl enable'
alias sy-disables='sudo systemctl disable'
alias sy-status='sudo systemctl status'
alias sy-logs='sudo journalctl -u'
alias sy-servicelist='systemctl list-units --type=service --all'
alias sy-failedunits='sudo systemctl --failed'
```

# How to setup aliases

## 1. Backup Your .bashrc

Before making any changes to your `.bashrc` file, it's crucial to create a backup. This will help you restore your previous aliases and settings if something goes wrong during the setup process.

To back up your `.bashrc`, you can use the following command:

```bash
cp ~/.bashrc ~/.bashrc.bak
```

## 2. Run setup script

```bash
chmod +x setup_aliases.sh
./setup_aliases.sh
```

# Postfix Domain Blocker

## Description 

This script provides a convenient way to manage domain blocking in Postfix, allowing administrators to quickly block or unblock domains and customize rejection messages. It leverages the Postfix transport map to enforce mail flow policies efficiently.

## Features
    Block Domains: Prevent emails from being sent to specific domains with customizable rejection messages.
    Unblock Domains: Easily remove domains from the block list, restoring email flow.
    List Blocked Domains: View all currently blocked domains along with their custom rejection messages.

## Prerequisites

    Postfix Mail Server
    Access to the Postfix configuration files
    Sudo or root privileges

## Usage

The script supports three operations: block, unblock, and list. The general syntax is:

```bash
sudo ./domain_blocker.sh [operation] [domain] [rejection message]
```

### Blocking a Domain

To block a domain, specify the block operation followed by the domain name and a custom rejection message:

```bash
sudo ./domain_blocker.sh block gmail.com "Your message to Gmail has been blocked. Contact support for more info."
```

### Unblocking a Domain

To unblock a previously blocked domain, use the unblock operation followed by the domain name:

```bash
sudo ./domain_blocker.sh unblock gmail.com
```

### Listing Blocked Domains

To list all currently blocked domains and their custom rejection messages, use the list operation:

```bash
sudo ./domain_blocker.sh list
```

### Configuration

    The script utilizes the /etc/postfix/transport file for domain management. Ensure this file exists and is correctly referenced in your Postfix configuration.
    After each block or unblock operation, the script automatically compiles the transport map and reloads Postfix to apply changes.
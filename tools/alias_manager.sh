#!/bin/bash

# Define your aliases here
custom_aliases=(
  # Git aliases
  'alias gi-s="git status"'
  'alias gi-a="git add"'
  'alias gi-c="git commit"'
  'alias gi-co="git checkout"'
  'alias gi-b="git branch"'
  'alias gi-l="git log"'
  'alias gi-d="git diff"'
  'alias gi-dc="git diff --cached"'
  'alias gi-r="git remote -v"'

  # Package Management aliases
  'alias pa-apt="sudo apt"'
  'alias pa-update="sudo apt update"'
  'alias pa-upgrade="sudo apt upgrade"'
  'alias pa-install="sudo apt install"'
  'alias pa-remove="sudo apt remove"'
  'alias pa-upgradable="sudo apt list --upgradable"'
  'alias pa-search="sudo apt-cache search"'

  # Services alias
  'alias se-services="sudo netstat -nutelap"'

  # Docker aliases
  'alias do-cls="docker ps -a"'
  'alias do-clr="docker ps"'
  'alias do-ils="docker images"'
  'alias do-ip="docker pull"'
  'alias do-rmc="docker rm"'
  'alias do-rmi="docker rmi"'
  'alias do-st="docker start"'
  'alias do-stop="docker stop"'
  'alias do-ins="docker inspect"'
  'alias do-run="docker run -it"'
  'alias do-cup="docker-compose up"'
  'alias do-cwn="docker-compose down"'

  # Systemd aliases
  'alias sy-start="sudo systemctl start"'
  'alias sy-stop="sudo systemctl stop"'
  'alias sy-restart="sudo systemctl restart"'
  'alias sy-reloads="sudo systemctl reload"'
  'alias sy-enables="sudo systemctl enable"'
  'alias sy-disables="sudo systemctl disable"'
  'alias sy-status="sudo systemctl status"'
  'alias sy-logs="sudo journalctl -u"'
  'alias sy-servicelist="systemctl list-units --type=service --all"'
  'alias sy-failedunits="sudo systemctl --failed"'
)

# Your .bashrc file
bashrc_file="$HOME/.bashrc"

# Function to check if an alias exists
alias_exists() {
  local alias_to_check="$1"
  if [[ -f "$bashrc_file" ]]; then
    grep -q "^$alias_to_check" "$bashrc_file"
    return $?
  else
    return 1
  fi
}

# Add aliases to .bashrc if they don't already exist
for alias_definition in "${custom_aliases[@]}"; do
  if ! alias_exists "$alias_definition"; then
    echo "$alias_definition" >> "$bashrc_file"
  else
    echo "Alias already exists: $alias_definition"
  fi
done

# Load the updated .bashrc
source "$bashrc_file"

echo "Aliases added or updated in $bashrc_file"

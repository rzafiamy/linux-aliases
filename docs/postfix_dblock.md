# Postfix Domain Blocker

## Description

This bash script automates the management of domain blocking in Postfix mail servers. It utilizes the Postfix transport map to dynamically block or unblock domains based on user commands. The script is designed to enhance email server administration by providing straightforward command-line options to manipulate mail routing rules, specifically for blocking unwanted email traffic.

## Features

- **Block domains**: Easily add domains to the block list with a custom error message for each.
- **Unblock domains**: Remove domains from the block list.
- **List blocked domains**: Display all domains currently blocked along with their corresponding error messages.
- **Apply changes**: Integrates changes into the Postfix system with a simple command, ensuring that updates are active without manual intervention.

## Pre-requisite

- `Postfix`: The script is specifically for systems running the Postfix mail server.
- `sed`: Used for editing files in a script.
- `grep`: Used to search text or show file content.
- Bash shell environment.

## Setup

1. Ensure Postfix is installed and correctly configured on your system.
2. Copy the script into a suitable directory, for example, `/usr/local/bin/postfix-domain-blocker.sh`.
3. Provide execute permissions to the script:
   ```bash
   chmod +x /usr/local/bin/postfix-domain-blocker.sh
   ```

## Configuration

Before using the script, verify that the paths to `TRANSPORT_MAP` and `POSTMAP` are correctly set according to your system's configuration:
- `TRANSPORT_MAP="/etc/postfix/transport"`
- `POSTMAP="/usr/sbin/postmap"`

## Usage

Run the script with the required operation (`block`, `unblock`, or `list`) followed by the necessary arguments:

- **Blocking a domain:**
  ```bash
  ./postfix-domain-blocker.sh block example.com "550 5.1.1 User unknown"
  ```
- **Unblocking a domain:**
  ```bash
  ./postfix-domain-blocker.sh unblock example.com
  ```
- **Listing blocked domains:**
  ```bash
  ./postfix-domain-blocker.sh list
  ```

Each time a domain is blocked or unblocked, the script automatically applies the changes and reloads Postfix to ensure the new settings take effect immediately.

## Advanced

Potential enhancements could include:
- Adding support for wildcard domain blocking.
- Providing a backup feature to save and restore previous configurations.
- Implementing a logging system to track changes made through the script.
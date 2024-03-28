#!/bin/bash

# Path to the Postfix transport map file
TRANSPORT_MAP="/etc/postfix/transport"

# Path to the Postmap command
POSTMAP="/usr/sbin/postmap"

# Function to block domains
block_domain() {
    local domain=$1
    local message="${@:2}"
    echo "$domain error: $message" >> "$TRANSPORT_MAP"
    echo "Blocked $domain with message: $message"
}

# Function to unblock domains
unblock_domain() {
    local domain=$1
    sed -i "/^$domain /d" "$TRANSPORT_MAP"
    echo "Unblocked $domain"
}

# Function to list all blocked domains
list_blocked_domains() {
    echo "Blocked domains:"
    grep "error:" "$TRANSPORT_MAP" | while read -r line; do
        echo "$line"
    done
}

# Function to apply changes
apply_changes() {
    $POSTMAP "$TRANSPORT_MAP"
    postfix reload
    echo "Changes applied. Postfix reloaded."
}

# Check for arguments
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 {block|unblock|list} domain [message]"
    exit 1
fi

# Main logic
case "$1" in
    block)
        if [ "$#" -lt 3 ]; then
            echo "Blocking requires a domain and a message."
            exit 1
        fi
        block_domain "${@:2}"
        ;;
    unblock)
        unblock_domain "$2"
        ;;
    list)
        list_blocked_domains
        ;;
    *)
        echo "Invalid operation: $1"
        echo "Usage: $0 {block|unblock|list} domain [message]"
        exit 1
        ;;
esac

# Apply changes only if block or unblock command is used
if [[ "$1" == "block" || "$1" == "unblock" ]]; then
    apply_changes
fi
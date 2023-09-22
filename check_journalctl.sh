#!/bin/bash

# Define colors using ANSI escape codes
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
RESET="\e[0m"

# Function to display log entries with color-coded severity
display_logs() {
    local log_level="$1"
    local since_time="$2"
    local until_time="$3"

    local log_options=()
    local log_command="journalctl"

    if [ -n "$log_level" ]; then
        log_options+=("-p" "$log_level")
    fi

    if [ -n "$since_time" ]; then
        log_options+=("--since" "$since_time")
    fi

    if [ -n "$until_time" ]; then
        log_options+=("--until" "$until_time")
    fi

    if [ "${#log_options[@]}" -gt 0 ]; then
        log_command+=" ${log_options[*]}"
    fi

    $log_command | while IFS= read -r line; do
        # Implement logic to format and colorize log entries based on severity
        # Use regex or other techniques to extract log timestamp, severity, and message
        # Apply colors accordingly
        # Display the log entry
    done
}

# Function to search logs for specific keywords
search_logs() {
    local keyword="$1"
    journalctl | grep --color=always -i "$keyword"
}

# Function to filter logs by time range
filter_logs_by_time() {
    local since_time="$1"
    local until_time="$2"
    display_logs "" "$since_time" "$until_time"
}

# Function to filter logs by severity level
filter_logs_by_severity() {
    local log_level="$1"
    display_logs "$log_level" "" ""
}

# Main menu for user interaction
main_menu() {
    while true; do
        clear
        echo "==== Journalctl Log Analyzer ===="
        echo "1. Display Logs"
        echo "2. Search Logs"
        echo "3. Filter by Time Range"
        echo "4. Filter by Severity"
        echo "5. Exit"
        read -p "Select an option: " choice

        case "$choice" in
            1)
                echo -n "Enter log level (e.g., error, warning, info, or press Enter for all): "
                read log_level
                echo -n "Enter start time (YYYY-MM-DD HH:MM:SS) or leave empty: "
                read since_time
                echo -n "Enter end time (YYYY-MM-DD HH:MM:SS) or leave empty: "
                read until_time
                display_logs "$log_level" "$since_time" "$until_time"
                read -p "Press Enter to continue..."
                ;;
            2)
                echo -n "Enter keyword to search for: "
                read keyword
                search_logs "$keyword"
                read -p "Press Enter to continue..."
                ;;
            3)
                echo -n "Enter start time (YYYY-MM-DD HH:MM:SS): "
                read since_time
                echo -n "Enter end time (YYYY-MM-DD HH:MM:SS): "
                read until_time
                filter_logs_by_time "$since_time" "$until_time"
                read -p "Press Enter to continue..."
                ;;
            4)
                echo -n "Enter log level (e.g., error, warning, info): "
                read log_level
                filter_logs_by_severity "$log_level"
                read -p "Press Enter to continue..."
                ;;
            5)
                exit 0
                ;;
            *)
                echo "Invalid choice. Please try again."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Start the script
main_menu

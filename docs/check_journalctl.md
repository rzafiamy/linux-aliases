# Journalctl Log Analyzer

## Description

This bash script provides a user-friendly interface for analyzing system logs using `journalctl`, the systemd journal service. It allows users to view, search, and filter log entries by severity, keyword, or time range. The script utilizes color coding to differentiate log severity levels, enhancing readability and making log analysis more efficient.

## Features

- **Color-coded log output**: Utilizes ANSI escape codes to display logs in different colors based on severity.
- **Flexible log filtering**: Allows filtering of logs by severity, time range, or custom keyword searches.
- **Interactive menu**: Provides an easy-to-navigate menu for performing various log analysis tasks without needing to write complex commands.
- **Real-time log search**: Implements live search functionality to find specific entries quickly.

## Pre-requisite

- `systemd` and `journalctl`: The script is designed for systems using systemd for service management and logging.
- `bash`: Script is written for bash shell.
- `grep`: Used for searching within logs.

## Setup

1. Ensure you have `systemd` and `journalctl` installed on your system. This is typically available by default on most Linux distributions with systemd.
2. Copy the script into a file, for example `log_analyzer.sh`.
3. Give the script execution permissions:
   ```bash
   chmod +x log_analyzer.sh
   ```

## Configuration

No specific configuration is required to start using the script. However, users can modify the ANSI color codes at the beginning of the script to customize the color scheme according to their preferences.

## Usage

Run the script from the terminal:
```bash
./log_analyzer.sh
```
Follow the interactive menu to perform the desired log analysis:
- **Display Logs**: Choose to display logs by specifying log level, and optionally setting start and end times.
- **Search Logs**: Input a keyword to search across all logs.
- **Filter by Time Range**: Set a specific time range to view logs from that period.
- **Filter by Severity**: Filter logs by their severity level, such as error, warning, or info.

## Advanced

Future enhancements could include:
- Parsing and color-coding logs based on additional criteria like application or user.
- Exporting selected log data to external files or services for further analysis.
- Implementing more advanced textual analysis and statistics on log data, such as frequency analysis of errors or warnings.
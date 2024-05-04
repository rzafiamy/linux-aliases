#!/bin/bash

# Define global variables
VENV_PATH="/home/cook/Documents/virtual-env"
CONTAINER_FOLDER_NAME=$(basename "$PWD")
FULL_VENV_PATH="$VENV_PATH/$CONTAINER_FOLDER_NAME"
PYTHONVERSION=$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1,2)

# Function to create virtual environment
create_venv() {
    # Check if the virtual environment directory already exists
    if [ -d "$FULL_VENV_PATH" ]; then
        echo "Virtual environment already exists at $FULL_VENV_PATH"
    else
        # Create the virtual environment
        python3 -m venv "$FULL_VENV_PATH"
        echo "Virtual environment created at $FULL_VENV_PATH"
    fi
}

# Function to activate virtual environment
activate_venv() {
    if [ -d "$FULL_VENV_PATH" ]; then
        source "$FULL_VENV_PATH/bin/activate"
        echo "Activated virtual environment at $FULL_VENV_PATH"
    else
        echo "Virtual environment does not exist at $FULL_VENV_PATH"
    fi
}


# Function to deactivate virtual environment
deactivate_venv() {
    # The deactivate function is part of the activate script
    if [ -n "$VIRTUAL_ENV" ]; then
        deactivate
        echo "Deactivated virtual environment."
    else
        echo "No virtual environment is currently activated."
    fi
}


# Function to remove virtual environment
remove_venv() {
    if [ -d "$FULL_VENV_PATH" ]; then
        # ask for confirmation
        read -p "Are you sure you want to remove the virtual environment at $FULL_VENV_PATH? (y/n): " confirm
        if [ "$confirm" != "y" ]; then
            echo "Operation cancelled."
            exit 1
        fi
        rm -rf "$FULL_VENV_PATH"
        echo "Removed virtual environment at $FULL_VENV_PATH"
    else
        echo "Virtual environment does not exist at $FULL_VENV_PATH"
    fi
}

# Function to install requirements
install_requirements() {

    if [ ! -n "$VIRTUAL_ENV" ]; then
        # activate the virtual environment
        activate_venv
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "requirements.txt" ]; then
            pip install -r requirements.txt
            echo "Installed requirements from requirements.txt"
        else
            echo "requirements.txt file does not exist."
        fi
    else
        echo "No virtual environment is activated. Please activate one first."
    fi
}

# Function to get the version of all the installed packages
get_package_versions() {
    if [ ! -n "$VIRTUAL_ENV" ]; then
        # activate the virtual environment
        activate_venv
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        pip freeze
    else
        echo "No virtual environment is activated. Please activate one first."
    fi
}

# check disk space usage of the virtual environment
check_disk_usage() {
    # Display the top 5 largest directories in lib/<python version>/site-packages
    LIST=$(du -h --max-depth=1 "$FULL_VENV_PATH/lib/python$PYTHONVERSION/site-packages" | sort -hr | head -n 10)
    # Display only base name of the directories and their sizes
    echo "$LIST"
}

# display environment variables in virtual environment
display_env_vars() {
    if [ ! -n "$VIRTUAL_ENV" ]; then
        # activate the virtual environment
        activate_venv
    fi
    
    if [ -n "$VIRTUAL_ENV" ]; then
        env | grep VIRTUAL_ENV
    else
        echo "No virtual environment is activated. Please activate one first."
    fi
}

# Main menu to select an option
echo "********************************"
echo "    - PYTHON Version: $PYTHONVERSION"
echo "    - Path: $FULL_VENV_PATH"
echo "********************************"
echo " "
echo "Select an option:"
echo " "
echo "    1. Create"
echo "    2. Activate"
echo "    3. Deactivate"
echo "    4. Remove"
echo "    5. Install requirements"
echo "    6. Get package versions"
echo "    7. Check disk usage"
echo "    8. Display environment variables"
echo " "
echo "********************************"
read -p "Enter the option number: " option


# Check if the base path exists
if [ ! -d "$VENV_PATH" ]; then
    # If the base path doesn't exist, create it
    mkdir -p "$VENV_PATH"
    echo "Created base directory for virtual environments at $VENV_PATH"
fi

# Execute the selected option
case $option in
    1)
        create_venv
        ;;
    2)
        activate_venv
        ;;
    3)
        deactivate_venv
        ;;
    4)
        remove_venv
        ;;
    5)
        install_requirements
        ;;
    6)
        get_package_versions
        ;;
    7)
        check_disk_usage
        ;;
    8)
        display_env_vars
        ;;
    *)
        echo "Invalid option. Please select a valid option."
        ;;
esac
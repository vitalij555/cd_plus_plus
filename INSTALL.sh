#!/bin/bash

CURRENT_DIR=$(dirname "$0")
SCRIPTS_PATH="${CURRENT_DIR}/scripts"
MAIN_SCRIPT_NAME="cd++.sh"
EXTENSION_SCRIPT_NAME="command_extensions.sh"
MAIN_SCRIPT_PATH="${SCRIPTS_PATH}/${MAIN_SCRIPT_NAME}"
EXTENSION_SCRIPT_PATH="${SCRIPTS_PATH}/${EXTENSION_SCRIPT_NAME}"
TARGET_DIR="/usr/local/bin"



if [[ $(id -u) -ne 0 ]]; then
    echo "Error: This script must be run as root"
    exit 1
fi



# Function to append to the appropriate shell configuration file
function append_to_shell_config {
    local script_path="$1"
    case "$SHELL" in
        *bash*)
            echo ". $script_path" >> ~/.bashrc
            ;;
        *zsh*)
            echo ". $script_path" >> ~/.zshrc
            ;;
        *fish*)
            echo "source $script_path" >> ~/.config/fish/config.fish
            ;;
        *csh*)
            echo "source $script_path" >> ~/.cshrc
            ;;
        *tcsh*)
            echo "source $script_path" >> ~/.tcshrc
            ;;
        *ksh*)
            echo ". $script_path" >> ~/.kshrc
            ;;
        # Add other shells here if needed
        *)
            echo "Unrecognized shell. Please add the script to your shell's configuration file manually."
            return 1
            ;;
    esac
}

# Install main script
cp "$MAIN_SCRIPT_PATH" "$TARGET_DIR/"
chmod +x "$TARGET_DIR/$MAIN_SCRIPT_NAME"
append_to_shell_config "$TARGET_DIR/$MAIN_SCRIPT_NAME"

# Ask user about installing extension
read -p "Do you want to install the command extensions as well? (yes/NO): " user_input
if [[ "$user_input" == "yes" ]]; then
    cp "$EXTENSION_SCRIPT_PATH" "$TARGET_DIR/"
    chmod +x "$TARGET_DIR/$EXTENSION_SCRIPT_NAME"
    append_to_shell_config "$TARGET_DIR/$EXTENSION_SCRIPT_NAME"
    echo "Command extensions successfully installed!"
else
    echo "Command extensions will not be installed"
fi

echo "Installation complete!"

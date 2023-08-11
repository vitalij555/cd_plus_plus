#!/bin/bash

SCRIPT_NAME="quick_jumper.sh"
TARGET_DIR="/usr/local/bin"

remove_source_line() {
    local config_file="$1"
    local line="$2"
    # Use sed to remove the line
    sed -i "\|$line|d" "$config_file"
}

# Remove the line that sources the script from the user's shell configuration file
if [[ "$SHELL" == *"bash"* ]]; then
    remove_source_line ~/.bashrc ". $TARGET_DIR/$SCRIPT_NAME"

elif [[ "$SHELL" == *"zsh"* ]]; then
    remove_source_line ~/.zshrc ". $TARGET_DIR/$SCRIPT_NAME"

elif [[ "$SHELL" == *"fish"* ]]; then
    # Fish has a different syntax for sourcing scripts
    remove_source_line ~/.config/fish/config.fish "source $TARGET_DIR/$SCRIPT_NAME"

elif [[ "$SHELL" == *"csh"* ]]; then
    remove_source_line ~/.cshrc "source $TARGET_DIR/$SCRIPT_NAME"

elif [[ "$SHELL" == *"tcsh"* ]]; then
    remove_source_line ~/.tcshrc "source $TARGET_DIR/$SCRIPT_NAME"

elif [[ "$SHELL" == *"ksh"* ]]; then
    remove_source_line ~/.kshrc ". $TARGET_DIR/$SCRIPT_NAME"

else
    echo "Unrecognized shell. Please remove the script from your shell's configuration file manually."
fi

# Remove the script from the target directory
rm "$TARGET_DIR/$SCRIPT_NAME"

echo "Uninstallation complete!"

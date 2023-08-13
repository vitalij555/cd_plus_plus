#!/bin/bash


CURRENT_DIR=$(dirname "$0")
SCRIPTS_PATH="${CURRENT_DIR}/scripts"
SCRIPT_NAME="cd++.sh"
QUICK_JUMP_SCRIPT_PATH="${SCRIPTS_PATH}/${SCRIPT_NAME}"
TARGET_DIR="/usr/local/bin"


cp "$QUICK_JUMP_SCRIPT_PATH" "$TARGET_DIR/"
chmod +x "$TARGET_DIR/$SCRIPT_NAME"


if [[ "$SHELL" == *"bash"* ]]; then
    echo ". $TARGET_DIR/$SCRIPT_NAME" >> ~/.bashrc

elif [[ "$SHELL" == *"zsh"* ]]; then
    echo ". $TARGET_DIR/$SCRIPT_NAME" >> ~/.zshrc

elif [[ "$SHELL" == *"fish"* ]]; then
    echo "source $TARGET_DIR/$SCRIPT_NAME" >> ~/.config/fish/config.fish

elif [[ "$SHELL" == *"csh"* ]]; then
    echo "source $TARGET_DIR/$SCRIPT_NAME" >> ~/.cshrc

elif [[ "$SHELL" == *"tcsh"* ]]; then
    echo "source $TARGET_DIR/$SCRIPT_NAME" >> ~/.tcshrc

elif [[ "$SHELL" == *"ksh"* ]]; then
    echo ". $TARGET_DIR/$SCRIPT_NAME" >> ~/.kshrc

# Add other shells here if needed

else
    echo "Unrecognized shell. Please add the script to your shell's configuration file manually."
fi

echo "Installation complete!"


# # Function to create and link new script
# # Accepts two parameters: 
# #   1. The command name (e.g., go, mark, list_dirs)
# #   2. The function name to call within the script (e.g., go, mark, list_dirs)
# create_and_link_script() {
#     COMMAND_NAME=$1
#     FUNCTION_NAME=$2

#     COMMAND_PATH="${BIN_PATH}/${COMMAND_NAME}"

#     echo "#!/bin/bash
# source $QUICK_JUMP_SCRIPT_PATH
# $FUNCTION_NAME \"\$@\"
# " > $COMMAND_PATH

#     chmod +x $COMMAND_PATH
# }

# # Create and link scripts for the go, mark, and list_dirs commands
# create_and_link_script "go" "go"
# create_and_link_script "mark" "mark"
# create_and_link_script "list_dirs" "list_dirs"

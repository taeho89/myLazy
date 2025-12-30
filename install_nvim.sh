#!/bin/bash

TASKS_DONE=()
TASKS_SKIPPED=()

# Check if unzip is installed
if ! command -v unzip &> /dev/null; then
    sudo apt install -y unzip > /dev/null 2>&1
    TASKS_DONE+=("Installed unzip")
else
    TASKS_SKIPPED+=("unzip (already installed)")
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    sudo apt install -y npm > /dev/null 2>&1
    TASKS_DONE+=("Installed npm")
else
    TASKS_SKIPPED+=("npm (already installed)")
fi

# Check if tar.gz file needs to be extracted
if [ ! -d "nvim-linux-x86_64" ]; then
    if [ -f "nvim-linux-x86_64.tar.gz" ]; then
        tar xzvf nvim-linux-x86_64.tar.gz > /dev/null 2>&1
        TASKS_DONE+=("Extracted nvim archive")
    else
        echo "Error: nvim-linux-x86_64.tar.gz file not found."
        exit 1
    fi
else
    TASKS_SKIPPED+=("extraction (directory already exists)")
fi

# Move to ~/.nvim-linux
if [ ! -d "$HOME/.nvim-linux" ]; then
    if [ -d "nvim-linux-x86_64" ]; then
        mv nvim-linux-x86_64 ~/.nvim-linux
        TASKS_DONE+=("Moved nvim to ~/.nvim-linux")
    else
        echo "Error: nvim-linux-x86_64 directory not found."
        exit 1
    fi
else
    TASKS_SKIPPED+=("move (~/.nvim-linux already exists)")
fi

# Check if alias needs to be added to .bashrc
if ! grep -q "alias nvim='~/.nvim-linux/bin/nvim'" ~/.bashrc; then
    echo "alias nvim='~/.nvim-linux/bin/nvim'" >> ~/.bashrc
    TASKS_DONE+=("Added nvim alias to .bashrc")
else
    TASKS_SKIPPED+=("alias (already in .bashrc)")
fi

# Summary
echo ""
echo "=== Installation Summary ==="
if [ ${#TASKS_DONE[@]} -gt 0 ]; then
    echo "Completed tasks:"
    for task in "${TASKS_DONE[@]}"; do
        echo "  ✓ $task"
    done
fi

if [ ${#TASKS_SKIPPED[@]} -gt 0 ]; then
    echo "Skipped tasks:"
    for task in "${TASKS_SKIPPED[@]}"; do
        echo "  - $task"
    done
fi

echo ""
echo "Run 'source ~/.bashrc' or open a new terminal to apply changes."

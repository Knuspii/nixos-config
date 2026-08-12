#!/usr/bin/env bash
#
# Custom Backup Script
#

BACKUP_DIR="$HOME/nixos-backup"

# Check user
if [ "$EUID" -eq 0 ]; then
    echo "Please run as a normal user, not root"
    exit 1
fi

rm -r $BACKUP_DIR

# Backup folder
mkdir -p "$BACKUP_DIR/config"

echo "Creating backup in: $BACKUP_DIR"

# --- Bash files (rename without dot) ---
if [ -f "$HOME/.bashrc" ]; then
    cp "$HOME/.bashrc" "$BACKUP_DIR/bashrc"
    echo "Backing up .bashrc → bashrc"
fi

if [ -f "$HOME/.bash_profile" ]; then
    cp "$HOME/.bash_profile" "$BACKUP_DIR/bash_profile"
    echo "Backing up .bash_profile → bash_profile"
fi

if [ -f "$HOME/backup-config.sh" ]; then
    cp "$HOME/backup-config.sh" "$BACKUP_DIR/backup-config.sh"
    echo "Backing up backup-config.sh → backup-config.sh"
fi

# --- Directories in config ---
CONFIG_DIRS=(
    "dconf"
    "autostart"
    "nautilus"
    "wallpaper"
    "easyeffects"
)

for d in "${CONFIG_DIRS[@]}"; do
    if [ -d "$HOME/.config/$d" ]; then
        cp -r "$HOME/.config/$d" "$BACKUP_DIR/config/"
        echo "Backing up folder $d"
    fi
done

echo "Backup complete!"
echo "All files are in: $BACKUP_DIR"

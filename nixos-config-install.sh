#!/usr/bin/env bash
#
# Script to install NixOS + KDE + my configs
# I made this mainly for me but feel free to use
# Made by Knuspii
#

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

# Ask for target user
read -p "Enter username: " USERNAME
if ! id "$USERNAME" &>/dev/null; then
  echo "User does not exist."
  exit 1
fi

# --- Clone configs ---
TMP_DIR=/home/$USERNAME/temp
sudo -u $USERNAME git clone --depth=1 --branch main https://github.com/knuspii/nixos-config.git $TMP_DIR
echo "Copying configuration files..."
sudo -u $USERNAME cp "$TMP_DIR/bashrc" "/home/$USERNAME/.bashrc"
sudo -u $USERNAME cp "$TMP_DIR/bash_profile" "/home/$USERNAME/.bash_profile"
sudo -u $USERNAME cp "$TMP_DIR/backup-config.sh" "/home/$USERNAME/backup-config.sh"
sudo -u $USERNAME cp -r "$TMP_DIR/config/." "/home/$USERNAME/.config/"
# NIXOS
sudo cp "$TMP_DIR/configuration.nix" "/etc/nixos/configuration.nix"
# Delete temp files
rm -rf "$TMP_DIR"

echo Installation finished!
read -p "Do you want to rebuild and reboot? [y/n] " answer
case "$answer" in
    [Yy]* ) echo "OK...";;
    [Nn]* ) echo "Aborted"; exit 0;;
    * ) echo "Invalid response"; exit 1;;
esac
sleep 3
sudo nixos-rebuild switch
sleep 3
reboot

exit 0

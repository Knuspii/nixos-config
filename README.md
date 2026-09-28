# NixOS Config

## Complete install Script with my custom configs:
Install latest NixOS version from here: https://nixos.org/download/ \
Go through the install process. \
Install NixOS without any Desktop. \
Install git and curl.

Just type this in your terminal.
```
curl -O https://raw.githubusercontent.com/Knuspii/nixos-config/main/nixos-config-install.sh && sudo bash nixos-config-install.sh
```

## Install my .bashrc only:
Just type this in your terminal.
```
curl -o "/home/$USER/.bashrc" https://raw.githubusercontent.com/Knuspii/nixos-config/main/bashrc
```

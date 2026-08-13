# NixOS Config

## Info:
- **OS:** NixOS
- **DE:** GNOME
- **WM:** Mutter
- **Shell:** Bash
* **Desktop Environment:** Pre-configured GNOME (via GDM display manager) with Wayland support.
* **Extensions:** Pre-configured with `Vitals` (system monitoring) and `Open Bar`.
* **Garbage Collection:** Automatic weekly cleanup of generations older than 30 days (`Sun 10:00`).
* **Nix Store Optimization:** Automatic deduplication and store optimization enabled.
* **Storage Improvements:** `noatime` mount option for SSD longevity and 4GB swap space.
* **Journald Controls:** System log capped at 500MB and retained for maximum 7 days.

## Why NixOS + GNOME?
Why run this setup? It boils down to two main things: reliability and clean design.
* **NixOS for Reliability**
  Your entire system configuration is stored in text files. If an update breaks something or you make a mistake, you can simply roll back to a working state during boot. Setting up a new computer takes just a few commands.
* **GNOME for Simplicity**
  GNOME offers a clean, distraction-free interface that stays out of your way and lets you focus on your work.

## Complete install Script with my custom configs:
Install latest NixOS version from here: https://nixos.org/download/ \
Go through the install process. \
Install NixOS without any Desktop. \
Install git and curl.

Just type this in your terminal.
```
curl -O https://raw.githubusercontent.com/Knuspii/nixos-config/main/nixos-config-install.sh && sudo bash nixos-config-install.sh
```

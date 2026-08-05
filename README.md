# Dotfiles & Hyprland Rice Installer

![Rice Preview](assets/rice.png)
![Neovim](assets/nvim.png)
![Wofi Launcher](assets/wofi.png)
![Lockscreen](assets/lockscreen.png)

## Overview

This repository contains curated dotfiles and a comprehensive installation script for ricing and configuring a Hyprland-based Arch Linux environment. The setup is designed for minimalism, aesthetics, and productivity, automating the deployment of essential packages, configs, themes, and customizations for your window manager, terminal, and development tools.

## Features

- Automated installation of recommended packages for Hyprland, terminal, and productivity
- Backup and deployment of dotfiles and configs for Hyprland, Kitty, NeoVim, Waybar, Wofi, and more
- Desktop and CLI integration for a seamless workflow
- Service management for essential system and user services
- Code - OSS and NeoVim plugin setup
- Safe backup of existing configs before overwriting

## Installation

Clone the repository and run the installer:

```sh
git clone https://github.com/baxvis/dotfiles.git
cd dotfiles
chmod +x install
./install --all
```

### Options

- `--packages`   Install recommended packages only
- `--dotfiles`   Install dotfiles and configs only
- `--all`        Run full setup (recommended)
- `--help`       Show help message

> **Note:** Existing configs will be backed up to `~/.dotfiles-backup/YYYYMMDDHHMMSS`. Review the script before running if you have custom settings.

## Requirements

- Arch Linux or derivative
- Internet connection
- Sudo privileges (for package installation)

## Resolution & Scaling

This setup is designed at **2880×1800@120**. The Hyprland config includes HiDPI scaling:

```conf
env = QT_SCALE_FACTOR,2
env = GTK_SCALE,2
env = GTK_DPI_SCALE,2
```

If you use a **lower resolution**, change these to `1` in `.config/hypr/hyprland.conf`.

## Components

| Component | Choice |
| --- | --- |
| **Window Manager** | Hyprland |
| **Terminal** | Kitty (Adwaita darker theme) |
| **Status Bar** | Waybar (top, transparent, dark) |
| **App Launcher** | Wofi (dark, blue accent) |
| **Notifications** | Mako (bottom-right, urgency-based colors) |
| **File Manager** | Thunar |
| **Wallpaper** | hyprpaper |
| **Idle / Lock** | hypridle / hyprlock |
| **Shell** | Zsh |
| **Editor** | NeoVim + Code - OSS |

## Keybindings

The main modifier (`$mainMod`) is **`LALT`**.

### General

| Key | Action |
| --- | --- |
| `Alt + Return` | Launch terminal (kitty) |
| `Ctrl + Q` | Kill active window |
| `Alt + E` | Launch file manager (thunar) |
| `Alt + V` | Toggle floating window |
| `Alt + P` | Launch app menu (wofi) |

### Focus & Movement

| Key | Action |
| --- | --- |
| `Alt + H` | Focus left |
| `Alt + J` | Focus down |
| `Alt + K` | Focus up |
| `Alt + L` | Focus right |

### Workspaces

| Key | Action |
| --- | --- |
| `Alt + 1-9` | Switch to workspace N |
| `Alt + Shift + 1-9` | Move window to workspace N |
| `Alt + Tab` | Switch to previous workspace |
| `Alt + Scroll Down/Up` | Scroll through workspaces |

### System

| Key | Action |
| --- | --- |
| `Alt + Shift + L` | Lock screen (hyprlock) |
| `Alt + Print` | Take screenshot (area → clipboard + swappy) |
| `Super + T` | Toggle touchpad |
| `Alt + B` | Toggle waybar |

### Media & Hardware Keys

| Key | Action |
| --- | --- |
| `XF86AudioRaiseVolume` | Volume up |
| `XF86AudioLowerVolume` | Volume down |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle mic mute |
| `XF86MonBrightnessUp` | Brightness up |
| `XF86MonBrightnessDown` | Brightness down |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioPlay` | Play / pause |
| `XF86AudioPause` | Play / pause |

### Mouse

| Key | Action |
| --- | --- |
| `Alt + LMB` | Move window |
| `Alt + RMB` | Resize window |

## Scripts

Located in `.config/hypr/scripts/`:

| Script | Purpose |
| --- | --- |
| `audio` | Volume up/down/mute via wpctl |
| `brightness` | Brightness up/down via brightnessctl |
| `screenshot` | Area screenshot → clipboard + swappy editor |
| `toggle-touchpad` | Enable/disable touchpad |
| `notify` | Custom notification helper for scripts |
| `battery-alert` | Cron job — alerts at low battery |

## Waybar Modules

Modules shown in the top bar (left to right):

- **Arch logo** - opens wofi on click
- **Workspaces** - hyprland workspace switcher
- **Idle inhibitor** - toggle idle inhibition
- **Audio** - volume slider, click opens pavucontrol
- **Network** - WiFi SSID / ethernet IP, click opens nmtui
- **CPU** - current usage
- **Memory** - current usage
- **Temperature** - CPU temperature
- **Keyboard layout** - current layout (US / SR-Latn / SR-Cyrl)
- **Battery** - percentage with charging indicator
- **Clock** - time and date

## Author

Created & maintained by [Jovan Bogovac](https://github.com/baxvis)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for improvements, bug fixes, or new features.

## License

This project is licensed under the [Apache License 2.0](LICENSE).

---

For more details, see the `install` script and explore the configs in `.config/`.

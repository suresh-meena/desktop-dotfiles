# Desktop dotfiles

Backup of my laptop desktop: CachyOS, Hyprland 0.57 (Lua config), Waybar,
dunst, fuzzel, kitty, hyprlock/hypridle, swaybg, in a muted Gruvbox palette.

This repository is **private**. The public `dotfiles` repo deliberately keeps
machine dotfiles out, so they live here instead.

## Use

```sh
./sync.sh        # copy the live configs into the repo, then review and commit
./install.sh     # copy them back onto a fresh install (keeps numbered backups)
```

## Layout

| Path | What |
|---|---|
| `home/.config/hypr/` | Hyprland (`hyprland.lua` + `config/*.lua`), hyprlock, hypridle |
| `home/.config/waybar/` | Bar: rectangular segments, power-profile indicator |
| `home/.config/{dunst,fuzzel,kitty,zathura,mpv,btop}/` | Notifications, launcher, terminal, PDF, video (VA-API), monitor |
| `home/.config/{gtk-3.0,gtk-4.0,qt6ct}/`, `mimeapps.list` | Toolkit settings, default apps |
| `home/.config/fish/config.fish` | Shell; Pure prompt options are set by `install.sh` |
| `home/.config/systemd/user/` | Dropbox and numpi sshfs mounts |
| `home/.local/bin/` | launcher, filesearch (Super+Shift+Space), calendar-popup, powermenu, wifimenu, cliphist menu/watcher, polkit agent, power-profile sync |
| `home/Pictures/Wallpapers/` | Dimmed Gruvbox wallpaper |
| `system/etc/udev/rules.d/` | Performance profile on AC, balanced on battery |
| `system/usr/local/bin/gpu-mode` | `sudo gpu-mode integrated` / `hybrid` turns the NVIDIA MX250 off/on (reboot to apply); `gpu-mode status` |
| `packages.txt` | Explicitly installed repo packages (`pacman -Qqen`) |

## Not in this repo

| Left out | Why / how to get it back |
|---|---|
| `~/.local/bin/numpi-sshfs-mount`, `fleetq-tunnel.service` | Contain fleet host details; restore from the fleet setup |
| `fleetctl`, `fq` | Come from the fleet tooling in the `dotfiles` repo |
| `dropbox-cli`, Dropbox itself | Download from Dropbox |
| `claude`, `codex`, `zed` links | Reinstall those apps |
| fish universal variables, browser profiles, keys | Machine state or secrets |

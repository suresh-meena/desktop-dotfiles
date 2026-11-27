#!/bin/sh
# Copy the live desktop configs from this machine into the repo.
# Run it, review `git diff`, then commit and push.
set -eu
REPO=$(cd "$(dirname "$0")" && pwd)
H=$REPO/home
mkdir -p "$H"

# Whole config directories
for d in hypr waybar dunst fuzzel kitty zathura mpv btop gtk-3.0 gtk-4.0 qt6ct gsimplecal satty; do
  mkdir -p "$H/.config/$d"
  rsync -a --delete "$HOME/.config/$d/" "$H/.config/$d/"
done

# Single files
mkdir -p "$H/.config/fish" "$H/.config/systemd/user" "$H/.local/bin" \
         "$H/.local/share/applications" "$H/Pictures/Wallpapers"
cp -p "$HOME/.config/mimeapps.list" "$H/.config/"
cp -p "$HOME/.config/fish/config.fish" "$H/.config/fish/"
cp -p "$HOME/.condarc" "$H/" 2>/dev/null || true   # conda: base not auto-activated
for u in dropbox.service numpi-d.service numpi-e.service battery-alert.service battery-alert.timer; do
  cp -p "$HOME/.config/systemd/user/$u" "$H/.config/systemd/user/"
done
mkdir -p "$H/.local/share/emoji"; cp -p "$HOME/.local/share/emoji/list.txt" "$H/.local/share/emoji/"
for s in launcher filesearch calendar-popup osd screenshot battery-alert emoji-picker audio-output powermenu wifimenu cliphist-menu cliphist-watch polkit-agent power-profile-sync; do
  cp -p "$HOME/.local/bin/$s" "$H/.local/bin/"
done
cp -p "$HOME/.local/share/applications/xfce4-about.desktop" "$H/.local/share/applications/"
cp -p "$HOME/Pictures/Wallpapers/sunset-gruvbox.jpg" "$H/Pictures/Wallpapers/"

# System files
# (copied only if present; the repo keeps its copy otherwise)
mkdir -p "$REPO/system/etc/udev/rules.d" "$REPO/system/usr/local/bin"
[ -e /etc/udev/rules.d/61-power-profile.rules ] && cp -p /etc/udev/rules.d/61-power-profile.rules "$REPO/system/etc/udev/rules.d/"
[ -e /usr/local/bin/gpu-mode ] && cp -p /usr/local/bin/gpu-mode "$REPO/system/usr/local/bin/"
# greetd login screen: only once ours is installed (not the package default)
mkdir -p "$REPO/system/etc/greetd" "$REPO/system/etc/pam.d"
grep -q initial_session /etc/greetd/config.toml 2>/dev/null && cp -p /etc/greetd/config.toml "$REPO/system/etc/greetd/"
grep -q gnome_keyring /etc/pam.d/greetd 2>/dev/null && cp -p /etc/pam.d/greetd "$REPO/system/etc/pam.d/"
grep -q gnome_keyring /etc/pam.d/hyprlock 2>/dev/null && cp -p /etc/pam.d/hyprlock "$REPO/system/etc/pam.d/"

# Package lists
pacman -Qqen > "$REPO/packages.txt"
pacman -Qqem > "$REPO/packages-foreign.txt" || true   # exits 1 when there are none

echo "Synced into $REPO"

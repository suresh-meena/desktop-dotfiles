#!/bin/sh
# Restore this desktop setup on a fresh CachyOS + Hyprland install.
# Existing files are kept as numbered backups (file.~1~) before being replaced.
set -eu
REPO=$(cd "$(dirname "$0")" && pwd)

echo "Copying configs into $HOME"
cp -a --backup=numbered "$REPO/home/." "$HOME/"

echo "Fish prompt (Pure) on one line"
fish -c 'set -U pure_enable_single_line_prompt true
         set -U pure_threshold_command_duration 5
         set -U pure_color_success yellow'

echo "Celluloid uses ~/.config/mpv/mpv.conf (hardware decoding)"
gsettings set io.github.celluloid-player.Celluloid mpv-config-file "$HOME/.config/mpv/mpv.conf" || true
gsettings set io.github.celluloid-player.Celluloid mpv-config-enable true || true

echo "User services"
systemctl --user daemon-reload
systemctl --user enable dropbox.service || true
systemctl --user enable battery-alert.timer || true
# numpi-d/numpi-e need ~/.local/bin/numpi-sshfs-mount, which is not in this
# repo (it holds host addresses). Restore it, then:
#   systemctl --user enable --now numpi-d.service numpi-e.service

cat <<MSG

Done. Still to do by hand:
  sudo pacman -S --needed - < $REPO/packages.txt
  sudo cp $REPO/system/etc/udev/rules.d/61-power-profile.rules /etc/udev/rules.d/
  sudo udevadm control --reload
  sudo install -m 755 $REPO/system/usr/local/bin/gpu-mode /usr/local/bin/gpu-mode
Then log out and back in.
MSG

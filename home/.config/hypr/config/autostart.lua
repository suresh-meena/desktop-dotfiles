-- Auto-start config (UWSM session)

hl.on("hyprland.start", function ()
    -- Booted by greetd auto-login: lock straight away, so the password is
    -- asked on the hyprlock screen while the desktop loads behind it.
    if os.getenv("HYPR_AUTOLOGIN") == "1" then
        hl.exec_cmd("hyprlock --grace 0 --immediate-render")
    end
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("/home/suresh/.local/bin/polkit-agent")
    hl.exec_cmd("swaybg -m fill -i /home/suresh/Pictures/Wallpapers/sunset-gruvbox.jpg")
    hl.exec_cmd("waybar")
    hl.exec_cmd("sh -c 'command -v hyprsunset >/dev/null && exec hyprsunset'")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dunst")
    hl.exec_cmd("/home/suresh/.local/bin/cliphist-watch")
    hl.exec_cmd("udiskie --smart-tray --automount --notify")
    hl.exec_cmd("/home/suresh/.local/bin/power-profile-sync")
end)

-- Environmental variables (for reference https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/)
-- if you use UWSM, define your variables in ~/.config/uwsm/env
-- if you don't use UWSM, define your variables here (e.g. hl.env("QT_QPA_PLATFORM", "wayland"))

-- if you have an NVIDIA GPU uncomment the following lines:

-- hl.env("GBM_BACKEND", "nvidia-drm") -- force GBM as a backend
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia") -- force GBM as a backend
-- hl.env("LIBVA_DRIVER_NAME", "nvidia") -- Hardware acceleration on NVIDIA GPUs
-- hl.env("__GL_GSYNC_ALLOWED", "1") -- Controls if G-Sync capable monitors should use Variable Refresh Rate (VRR)

-- Session environment (lightdm starts plain Hyprland, so ~/.config/uwsm/env is not read)
-- Intel iGPU renders the desktop; NVIDIA MX250 stays asleep
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("MOZ_DRM_DEVICE", "/dev/dri/renderD128")
-- Toolkits
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("BROWSER", "firefox")
-- Cursor
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "18")
-- UTF-8 locale (plain en_IN maps to ISO-8859-1: breaks btop, dead keys in fuzzel)
hl.env("LANG", "en_IN.UTF-8")
hl.env("LC_ALL", "en_IN.UTF-8")
-- Accessibility bus off (no screen reader in use): saves memory, speeds up GTK apps
hl.env("NO_AT_BRIDGE", "1")
hl.env("GTK_A11Y", "none")

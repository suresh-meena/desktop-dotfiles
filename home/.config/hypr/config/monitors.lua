-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = MONITOR1,
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

hl.monitor({
    output    = MONITOR1,
    mode      = "preferred",
    position  = "auto",
    scale     = "1",
})

-- BenQ RD240Q (24") on HDMI. The laptop's HDMI port maxes out at 4K@30 Hz,
-- so use 2560x1440@60 for smooth motion and readable size.
-- Sharper but laggier alternative: mode = "3840x2160@30", scale = "1.5"
hl.monitor({
    output    = "desc:BNQ BenQ RD240Q V3R00689019",
    mode      = "modeline 268.50 2560 2608 2640 2720 1600 1603 1609 1646 +hsync -vsync",  -- native 16:10, reduced blanking (fits laptop HDMI)
    position  = "1920x0",
    scale     = "1",
})

-- Laptop panel on the left
hl.monitor({
    output    = "eDP-1",
    mode      = "1920x1080@60",
    position  = "0x0",
    scale     = "1",
})

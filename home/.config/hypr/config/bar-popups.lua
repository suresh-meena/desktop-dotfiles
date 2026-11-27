-- Panels opened from the bar (~/.local/bin/bar-popup): float just under the
-- bar and close with Esc.

local POPUPS = {
    ["gsimplecal"]                 = true,
    ["bar-popup-btop"]             = true,
    ["bar-popup-nmtui"]            = true,
    ["blueman-manager"]            = true,
    ["org.pulseaudio.pavucontrol"] = true,
}

-- Esc closes the focused panel. non_consuming: Esc still reaches every app
-- as usual, so it keeps working in terminals, editors and Claude.
hl.bind("Escape", function()
    local w = hl.get_active_window()
    if w and POPUPS[w.class] then
        hl.dispatch(hl.dsp.window.close({ window = "address:" .. w.address }))
    end
end, { non_consuming = true })

-- Placement: left panels under the clock/CPU, right panels under their icons.
local function panel(class, w, h, x)
    hl.window_rule({
        match = { class = "^(" .. class:gsub("%.", "\\.") .. ")$" },
        float = true,
        size  = { tostring(w), tostring(h) },
        move  = { x, "36" },
    })
end
panel("bar-popup-btop",             900, 560, "8")
panel("bar-popup-nmtui",            640, 460, "monitor_w-648")
panel("blueman-manager",            600, 440, "monitor_w-608")
panel("org.pulseaudio.pavucontrol", 620, 460, "monitor_w-628")

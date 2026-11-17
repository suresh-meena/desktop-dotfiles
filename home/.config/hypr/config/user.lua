-- My additions (GNOME/XFCE muscle memory)
local mainMod = "SUPER"
local launch = "uwsm app -- "

hl.bind("ALT + K",          hl.dsp.exec_cmd(launch .. TERMINAL))
hl.bind("CONTROL + ALT + T", hl.dsp.exec_cmd(launch .. TERMINAL))
hl.bind("ALT + F4",         hl.dsp.window.close())
hl.bind("ALT + F2",         hl.dsp.exec_cmd("/home/suresh/.local/bin/launcher"))
hl.bind("ALT + F1",         hl.dsp.exec_cmd("/home/suresh/.local/bin/launcher"))
hl.bind("CONTROL + ALT + Left",  hl.dsp.focus({ workspace = "m-1" }))
hl.bind("CONTROL + ALT + Right", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + Prior", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + Next",  hl.dsp.focus({ workspace = "m+1" }))

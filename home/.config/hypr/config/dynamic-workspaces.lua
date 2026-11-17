-- Dynamic workspaces: never leave a numbered gap.
-- When a workspace empties and closes (or one is created past the end),
-- the ones after it shift down, so 1 3 4 becomes 1 2 3. Windows, monitors
-- and focus stay where they are; only the numbers change.

local function compact()
    local list = {}
    for _, ws in ipairs(hl.get_workspaces()) do
        -- only ordinary numbered workspaces (skip special/scratchpad and named ones)
        if not ws.special and ws.id and ws.id > 0 and ws.name == tostring(ws.id) then
            table.insert(list, ws)
        end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    for i, ws in ipairs(list) do
        if ws.id ~= i then
            hl.dispatch(hl.dsp.workspace.change_id({ workspace = ws.id, id = i }))
        end
    end
end

-- Run just after the event, once Hyprland has finished adding/removing it.
local function later()
    hl.timer(compact, { timeout = 30, type = "oneshot" })
end

hl.on("workspace.removed", later)
hl.on("workspace.created", later)
hl.on("hyprland.start", later)

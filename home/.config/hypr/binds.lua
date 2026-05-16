-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

local terminal = [[kitty]]
local menu = [[sirjames-launch-walker]]

local function get_index(list, target)
    local idx = nil
    for i, curr in ipairs(list) do
	if curr == target then
	    idx = i
	    break
	end
    end
    return idx
end

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd([[uwsm-app -- ]] .. terminal), { description = "Terminal" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu), { description = "Menu" })

hl.bind(mainMod .. " + C", hl.dsp.window.close())

for k, d in pairs({ H = "left", J = "down", K = "up", L = "right" }) do
    hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ direction = d }))
    hl.bind(mainMod .. " + SHIFT + " .. k, hl.dsp.window.move({ direction = d }))
end

for w = 1, 10 do
    k = w % 10
    hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ workspace = w }))
    hl.bind(mainMod .. " + SHIFT + " .. k, hl.dsp.window.move({ workspace = w }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

local layouts = {"dwindle", "scrolling"}

hl.bind(mainMod .. " + CTRL + SHIFT + L", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local curr_layout = ws.tiled_layout
    local next_layout = layouts[get_index(layouts, curr_layout) % #layouts + 1]
    if not next_layout then return end

    local ws_info = tostring(ws.id or ws.name)
    hl.workspace_rule({
	workspace = ws_info,
	layout = next_layout
    })

    hl.notification.create({
	text = "[LAYOUTS] Switched workspace" .. ws_info .. " from " .. curr_layout .. " to " .. next_layout,
	timeout = 3000,
	icon = "OK"
    })
end)

local l = hl.get_config("general.layout")
if l == "scrolling" then
    hl.bind(mainMod .. " + SHIFT + PERIOD", hl.dsp.layout("swapcol r"))
    hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.layout("swapcol l"))
end
if l == "dwindle" then
end


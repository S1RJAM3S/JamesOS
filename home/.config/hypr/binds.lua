-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

local terminal = [[kitty]]
local menu = [[sirjames-launch-walker]]

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd([[uwsm-app -- ]] .. terminal), { description = "Terminal" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu), { description = "Menu" })

hl.bind(mainMod .. " + C", hl.dsp.window.close())

for k, d in pairs({ H = "left", J = "down", K = "up", L = "right" }) do
	hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ direction = d }))
end

for w = 1, 10 do
	k = w % 10
	hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ workspace = w }))
	hl.bind(mainMod .. " + SHIFT + " .. k, hl.dsp.window.move({ workspace = w }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

local l = hl.get_config("general.layout")
if l == "scrolling" then
	hl.bind(mainMod .. " + PERIOD", hl.dsp.layout("move +col"))
	hl.bind(mainMod .. " + COMMA", hl.dsp.layout("move -col"))
	hl.bind(mainMod .. " + SHIFT + PERIOD", hl.dsp.layout("swapcol r"))
	hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.layout("swapcol l"))
end

-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

for k, d in pairs({ H = "left", J = "down", K = "up", L = "right" }) do
	hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ direction = d }))
end

for k = 0, 9 do
	hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ workspace = k }))
	hl.bind(mainMod .. " + SHIFT + " .. k, hl.dsp.window.move({ workspace = k }))
end

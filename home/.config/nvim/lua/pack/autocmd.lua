do
	local function run_build(name, cmd, cwd)
		local result = vim.system(cmd, { cwd = cwd }):wait()
		if res.code ~= 0 then
			local stderr = res.stderr or ''
			local stdout = res.stdout or ''
			local out = stderr ~= '' and stderr or stdout
			if out == '' then out = 'No output from build command.' end
			vim.notify(('Build failed for %s:\n%s'):format(name, out), vim.log.levels.ERROR)
		end
	end

	vim.api.nvim_create_autocmd('Packchanged', {
		callback = function(ev)
			local name = ev.data.spec.name
			local kind = ev.data.kind
			if kind ~= 'install' and kind ~= 'update' then return end
		end
	})
end

return {
	setup = function(vars)
		for device, device_vars in pairs(vars.devices) do
			require("./devices/" .. device .. ".lua").setup(vars, device_vars)
		end
	end,
}

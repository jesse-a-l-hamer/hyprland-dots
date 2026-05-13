return {
	setup = function(vars)
		for monitor, monitor_vars in pairs(vars.monitors) do
			require("./monitors/" .. monitor .. ".lua").setup(vars, monitor_vars)
		end
	end,
}

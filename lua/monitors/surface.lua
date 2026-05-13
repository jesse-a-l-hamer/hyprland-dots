return {
	setup = function(vars, monitor_vars)
		local output = "desc:LG Display 0x06B1 0x002127A1"
		local mode = "2880x1920@120.00"
		local position = "0x0"
		local scale = "1.5"

		hl.monitor({
			output = output,
			mode = mode,
			position = position,
			scale = scale,
		})
	end,
}

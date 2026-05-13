return {
	setup = function(vars, monitor_vars)
		local output = "desc:BOE 0x0BB7"
		local mode = "3840x2160@144.0"
		local position = "3840x1080"
		local scale = "2.0"

		hl.monitor({
			output = output,
			mode = mode,
			position = position,
			scale = scale,
		})
	end,
}

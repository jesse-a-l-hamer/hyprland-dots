return {
	setup = function(vars, monitor_vars)
		local output = "desc:Samsung Electric Company QCQ90 0x01000E00"
		local mode = "3840x2160@119.88"
		local position = "0x0"
		local scale = "1.0"

		local bitdepth = 8
		local color_opts = monitor_vars.opts_8bpc

		if monitor_vars.opts_10bpc.enabled then
			bitdepth = 10
			color_opts = monitor_vars.opts_10bpc
		end

		hl.monitor({
			output = output,
			mode = mode,
			position = position,
			scale = scale,
			bitdepth = bitdepth,
			cm = color_opts.cm,
			sdrbrightness = color_opts.sdrbrightness,
			sdrsaturation = color_opts.sdrsaturation,
		})
	end,
}

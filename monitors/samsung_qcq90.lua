return {
	setup = function(vars, monitor_vars)
		local output = "desc:Samsung Electric Company QCQ90 0x01000E00"
		local mode = "3840x2160@119.88"
		local position = "0x0"
		local scale = "1.0"

		local bitdepth = 8
		local cm = "auto"
		local sdrbrightness = 1.2
		local sdrsaturation = 1.0

		if monitor_vars.use_10bpc then
			bitdepth = 10
		end

		hl.monitor({
			output = output,
			mode = mode,
			position = position,
			scale = scale,
			bitdepth = bitdepth,
			cm = cm,
			sdrbrightness = sdrbrightness,
			sdrsaturation = sdrsaturation,
		})
	end,
}

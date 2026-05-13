return {
	setup = function(vars)
		hl.config({
			render = {
				cm_sdr_eotf = "gamma22force",
				cm_auto_hdr = 1,
				use_shader_blur_blend = true,
			},
		})
	end,
}

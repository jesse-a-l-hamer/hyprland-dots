return {
	setup = function(vars)
		hl.config({
			layout = {
				single_window_aspect_ratio = { 4, 3 },
			},
			dwindle = {
				preserve_split = true,
				smart_resizing = true,
			},
			master = {
				new_status = "master",
			},
		})
	end,
}

return {
	setup = function(vars)
		hl.config({
			xwayland = {
				enabled = true,
				create_abstract_socket = true,
			},
		})
	end,
}

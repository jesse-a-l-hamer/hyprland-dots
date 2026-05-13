return {
	setup = function(vars)
		hl.gesture({
			fingers = 3,
			direction = "horizontal",
			action = "workspace",
		})
		hl.config({
			gestures = {
				workspace_swipe_create_new = true,
				workspace_swipe_cancel_ratio = 0.15,
			},
		})
	end,
}

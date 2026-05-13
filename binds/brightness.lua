return {
	setup = function(vars)
		hl.bind(
			"XF86MonBrightnessUp",
			hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
			{ repeating = true, locked = true }
		)
		hl.bind(
			"XF86MonBrightnessDown",
			hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
			{ repeating = true, locked = true }
		)
	end,
}

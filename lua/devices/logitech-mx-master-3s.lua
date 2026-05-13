return {
	setup = function(vars, device_vars)
		hl.device({
			name = "logitech-mx-master-3s",
			sensitivity = device_vars.sensitivity,
			accel_profile = device_vars.accel_profile,
		})
	end,
}

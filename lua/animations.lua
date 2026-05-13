return {
	setup = function(vars)
		hl.config({
			animations = {
				enable = vars.animations.enable,
				workspace_wraparound = vars.animations.workspace_wraparound,
			},
		})
		require("./animations/" .. vars.animations.animation .. ".lua").setup(vars)
	end,
}

return {
	setup = function(vars)
		local cursor_conf = {
			persistent_warps = true,
			inactive_timeout = 0,
		}

		local misc_conf = {
			force_default_wallpaper = 0,
			disable_hyprland_logo = true,
			disable_splash_rendering = true,
			font_family = vars.theme.fonts.default,
			key_press_enables_dpms = true,
			allow_session_lock_restore = true,
			disable_xdg_env_checks = true,
			enable_swallow = false,
			swallow_regex = "(kitty)",
			background_color = vars.theme.colors.map.base,
			["col.splash"] = vars.theme.colors.map.accent,
		}

		local ecosystem_conf = {
			no_update_news = true,
			no_donation_nag = true,
			enforce_permissions = true,
		}

		local quirks_conf = {
			prefer_hdr = 1,
		}

		hl.config({
			cursor = cursor_conf,
			misc = misc_conf,
			ecosystem = ecosystem_conf,
			quirks = quirks_conf,
		})
	end,
}

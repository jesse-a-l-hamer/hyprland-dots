return {
	setup = function(vars)
		if not vars.env.uwsm then
			-- theming
			hl.env("HYPRCURSOR_THEME", vars.env.cursor_theme)
			hl.env("HYPRCURSOR_SIZE", vars.env.cursor_size)
			hl.env("XCURSOR_THEME", vars.env.cursor_theme)
			hl.env("XCURSOR_SIZE", vars.env.cursor_size)
			hl.env("GTK_THEME", vars.theme.gtk.name)
			hl.env("ICON_THEME", vars.theme.icons.name)
			hl.env("COLOR_SCHEME", "prefer-dark")

			-- Aquamarine Environment Variables
			hl.env("AQ_DRM_DEVICES", "/dev/dri/nvidia-dgpu:/dev/dri/intel-igpu")

			-- Toolkit Backend Variables
			hl.env("GDK_BACKEND", "wayland,x11,*")
			hl.env("QT_QPA_PLATFORM", "wayland;xcb")
			hl.env("SDL_VIDEODRIVER", "wayland")
			hl.env("CLUTTER_BACKEND", "wayland")

			-- XDG Specifications
			hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
			hl.env("XDG_SESSION_TYPE", "wayland")
			hl.env("XDG_SESSION_DESKTOP", "Hyprland")

			-- Qt Variables
			hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
			hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
			hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

			-- NVIDIA Specific
			hl.env("GBM_BACKEND", "nvidia-drm")
			hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
			hl.env("LIBVA_DRIVER_NAME", "nvidia")
			hl.env("NVD_BACKEND", "direct")
			hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

			hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")

			hl.env("DCONF_PROFILE", "hyprland")

			hl.env("SHIKANE_LOG", "info")
			hl.env("SHIKANE_LOG_TIME", "1")
		end
	end,
}

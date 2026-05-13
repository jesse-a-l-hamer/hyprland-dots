return {
	setup = function(vars)
		hl.on("hyprland.start", function()
			hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
			hl.exec_cmd(
				"systemctl --user import-environment "
					.. "QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP "
					.. "XDG_SESSION_TYPE XDG_SESSION_DESKTOP XDG_CONFIG_HOME GTK_THEME"
			)
			hl.exec_cmd("hyprpm reload -n")
		end)
	end,
}

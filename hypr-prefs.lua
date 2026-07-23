return {
    setup = function()
        local vars = require("hypr-vars")
        local cursor_vars = vars.prefs.cursor
        local ecosystem_vars = vars.prefs.ecosystem
        local misc_vars = vars.prefs.misc
        local quirks_vars = vars.prefs.quirks

        hl.config({
            cursor = {
                persistent_warps = cursor_vars.persistent_warps,
                inactive_timeout = cursor_vars.inactive_timeout,
            },
            ecosystem = {
                no_update_news = ecosystem_vars.no_update_news,
                no_donation_nag = ecosystem_vars.no_donation_nag,
                enforce_permissions = ecosystem_vars.enforce_permissions,
            },
            misc = {
                force_default_wallpaper = misc_vars.force_default_wallpaper,
                disable_hyprland_logo = misc_vars.disable_hyprland_logo,
                disable_splash_rendering = misc_vars.disable_splash_rendering,
                key_press_enables_dpms = misc_vars.key_press_enables_dpms,
                allow_session_lock_restore = misc_vars.allow_session_lock_restore,
                disable_xdg_env_checks = misc_vars.disable_xdg_env_checks,
                enable_swallow = misc_vars.enable_swallow,
                swallow_regex = misc_vars.swallow_regex,
                swallow_exception_regex = misc_vars.swallow_exception_regex,
                font_family = vars.theme.fonts.default,
                background_color = "rgb(" .. vars.theme.colors.map.base .. ")",
                ["col.splash"] = "rgb(" .. vars.theme.colors.map.accent .. ")",
            },
            quirks = {
                prefer_hdr = quirks_vars.prefer_hdr,
            },
        })
    end,
}

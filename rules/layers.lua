local shell_overrides = {
    default = function(layer_vars) end,
    noctalia = function(layer_vars)
        hl.layer_rule({
            name = "noctalia",
            match = {
                namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
            },
            no_anim = true,
            ignore_alpha = 0.5,
            blur = true,
            blur_popups = true,
        })
    end,
}

return {
    setup = function(vars)
        local layer_vars = vars.rules.layers
        local shell = vars.apps.shell

        hl.layer_rule({
            name = "rofi",
            match = { namespace = "^(rofi)$" },
            blur = layer_vars.launcher.blur,
            ignore_alpha = layer_vars.launcher.ignore_alpha,
            no_anim = layer_vars.launcher.no_anim,
        })
        hl.layer_rule({
            name = "walker",
            match = { namespace = "^(walker)$" },
            blur = layer_vars.launcher.blur,
            ignore_alpha = layer_vars.launcher.ignore_alpha,
            no_anim = layer_vars.launcher.no_anim,
        })
        hl.layer_rule({
            name = "waybar",
            match = { namespace = "waybar" },
            blur = layer_vars.bar.blur,
            blur_popups = layer_vars.bar.blur_popups,
            ignore_alpha = layer_vars.bar.ignore_alpha,
            above_lock = layer_vars.bar.above_lock,
        })
        hl.layer_rule({
            name = "ashell",
            match = { namespace = "ashell-main-layer" },
            blur = layer_vars.bar.blur,
            blur_popups = layer_vars.bar.blur_popups,
            ignore_alpha = layer_vars.bar.ignore_alpha,
            above_lock = layer_vars.bar.above_lock,
        })
        hl.layer_rule({
            name = "wvkbd",
            match = { namespace = "wvkbd" },
            blur = layer_vars.virtual_keyboard.blur,
            blur_popups = layer_vars.virtual_keyboard.blur_popups,
            ignore_alpha = layer_vars.virtual_keyboard.ignore_alpha,
            above_lock = layer_vars.virtual_keyboard.above_lock,
            animation = layer_vars.virtual_keyboard.animation,
        })
        hl.layer_rule({
            name = "logout_dialog",
            match = { namespace = "logout_dialog" },
            blur = layer_vars.logout_dialog.blur,
            blur_popups = layer_vars.logout_dialog.blur_popups,
        })
        hl.layer_rule({
            name = "notifications",
            match = { namespace = "notifications" },
            blur = layer_vars.notifications.blur,
            blur_popups = layer_vars.notifications.blur_popups,
            ignore_alpha = layer_vars.notifications.ignore_alpha,
        })
        local overrides = shell_overrides[shell] or shell_overrides.default
        overrides(layer_vars)
    end,
}

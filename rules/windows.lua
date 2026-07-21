local shell_overrides = {
    default = function(rules) end,
    noctalia = function(rules)
        hl.window_rule({
            match = { class = "dev.noctalia.Noctalia" },
            float = true,
            size = { 1080, 920 },
        })
    end,
}

return {
    setup = function(vars)
        local rules = vars.rules.windows
        local shell = vars.apps.shell

        if rules.browser.idle_inhibit then
            hl.window_rule({
                name = "browser-idle_inhibit",
                match = { tag = "browser" },
                idle_inhibit = "fullscreen",
            })
        end

        if rules.browser.opacity then
            hl.window_rule({
                name = "browser-opacity",
                match = { tag = "browser" },
                opacity = "1.00 override 0.90 override 1",
            })
        end

        if rules.desktop_portal.opacity then
            hl.window_rule({
                name = "desktop_portal-opacity",
                match = { tag = "desktop_portal" },
                opacity = "0.90 override 0.70 override 1",
            })
        end

        if rules.media_player.idle_inhibit then
            hl.window_rule({
                name = "media_player-idle_inhibit",
                match = { tag = "media_player" },
                idle_inhibit = "focus",
            })
        end

        if rules.picture_in_picture.pin_float then
            hl.window_rule({
                name = "picture_in_picture-pin_float",
                match = { tag = "picture_in_picture" },
                pin = true,
                float = true,
            })
        end

        if rules.picture_in_picture.keep_aspect_ratio then
            hl.window_rule({
                name = "picture_in_picture-keep_aspect_ratio",
                match = { tag = "picture_in_picture" },
                keep_aspect_ratio = true,
            })
        end

        if rules.picture_in_picture.move_size then
            hl.window_rule({
                name = "picture_in_picture-move_size",
                match = { tag = "picture_in_picture" },
                move = { "(monitor_w*0.73)", "(monitor_h*0.72)" },
                size = { "(monitor_w/2)", "(monitor_h/2)" },
            })
        end

        if rules.polkit_agent.opacity then
            hl.window_rule({
                name = "polkit_agent-opacity",
                match = { tag = "polkit_agent" },
                opacity = "0.90 override 0.70 override 1",
            })
        end

        if rules.qt_manager.opacity then
            hl.window_rule({
                name = "qt_manager-opacity",
                match = { tag = "qt_manager" },
                opacity = "0.90 override 0.80 override 1",
            })
        end

        if rules.terminal.opacity then
            hl.window_rule({
                name = "terminal-opacity",
                match = { tag = "terminal" },
                opacity = "1.00 override 0.80 override 1",
            })
        end

        if rules.utility.opacity then
            hl.window_rule({
                name = "utility-opacity",
                match = { tag = "utility" },
                opacity = "0.90 override 0.70 override 1",
            })
        end

        if rules.vault.pin_float then
            hl.window_rule({
                name = "vault-pin_float",
                match = { tag = "vault" },
                float = true,
                pin = true,
            })
        end

        if rules.vault.move_size then
            hl.window_rule({
                name = "vault-size_move",
                match = { tag = "vault" },
                move = { "monitor_w*0.02", "monitor_h*0.02" },
                size = { "monitor_w*0.45", "monitor_h*0.35" },
            })
        end

        if rules.video_call.pin_float then
            hl.window_rule({
                name = "video_call-pin_float",
                match = { tag = "video_call" },
                float = true,
                pin = true,
            })
        end

        if rules.untagged.fix_wayland_drags then
            hl.window_rule({
                name = "fix_wayland_drags",
                match = {
                    class = "^$",
                    title = "^$",
                    xwayland = true,
                    float = true,
                    fullscreen = false,
                    pin = false,
                },
                no_focus = true,
            })
        end

        if rules.untagged.smart_gaps then
            hl.window_rule({
                name = "smart_gaps-single_window",
                match = {
                    workspace = "w[tv1]s[false]",
                    float = false,
                },
                border_size = 0,
                rounding = 0,
            })
            hl.window_rule({
                name = "smart_gaps-maximized",
                match = {
                    workspace = "f[1]s[false]",
                    float = false,
                },
                border_size = 0,
                rounding = 0,
            })
        end

        if rules.untagged.suppress_maximize_events then
            hl.window_rule({
                name = "suppress_maximize_events",
                match = { class = ".*" },
                suppress_event = "maximize",
            })
        end

        (shell_overrides[shell] or shell_overrides.default)(rules)
    end,
}

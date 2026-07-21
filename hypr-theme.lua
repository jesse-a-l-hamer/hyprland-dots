local merge = require("utils").merge
local shell_overrides = function(shell, general, decoration, group)
    local overrides = {
        default = {
            general = {},
            decoration = {},
            group = {},
        },
        noctalia = {
            general = {
                gaps_in = 5,
                gaps_out = 10,
            },
            decoration = {
                rounding = 20,
                rounding_power = 2,

                shadow = {
                    enabled = true,
                    range = 4,
                    render_power = 3,
                    color = 0xee1a1a1a,
                },

                blur = {
                    enabled = true,
                    size = 3,
                    passes = 2,
                    vibrancy = 0.1696,
                },
            },
            group = {},
        },
    }

    merge(general, (overrides[shell] or overrides.default).general)
    merge(decoration, (overrides[shell] or overrides.default).decoration)
    merge(group, (overrides[shell] or overrides.default).group)
end

return {
    setup = function(vars)
        local col = vars.theme.colors
        local active_alpha = col.alpha.active .. ")"
        local inactive_alpha = col.alpha.inactive .. ")"
        local gradient_degrees = col.gradient_degrees
        local shell = vars.apps.shell
        local border = {
            col1 = "rgba(" .. col.map.accent,
            col2 = "rgba(" .. col.map.accent_secondary,
            nogroup_col1 = "rgba(" .. col.map.accent2,
            nogroup_col2 = "rgba(" .. col.map.accent2_secondary,
            group_col1 = "rgba(" .. col.map.accent3,
            group_col2 = "rgba(" .. col.map.accent3_secondary,
            group_locked_col1 = "rgba(" .. col.map.accent4,
            group_locked_col2 = "rgba(" .. col.map.accent4_secondary,
            groupbar = "rgba(" .. col.map.base,
            groupbar_locked = "rgba(" .. col.map.alternate_base,
        }

        local general_conf = {
            border_size = 2,
            gaps_in = 5,
            gaps_out = 20,
            float_gaps = 10,
            resize_on_border = true,
            no_focus_fallback = false,
            allow_tearing = false,
            ["col.active_border"] = {
                colors = {
                    border.col1 .. active_alpha,
                    border.col2 .. active_alpha,
                },
                angle = gradient_degrees,
            },
            ["col.inactive_border"] = {
                colors = {
                    border.col1 .. inactive_alpha,
                    border.col2 .. inactive_alpha,
                },
                angle = gradient_degrees,
            },
            ["col.nogroup_border_active"] = {
                colors = {
                    border.nogroup_col1 .. active_alpha,
                    border.nogroup_col2 .. active_alpha,
                },
                angle = gradient_degrees,
            },
            ["col.nogroup_border"] = {
                colors = {
                    border.nogroup_col1 .. inactive_alpha,
                    border.nogroup_col2 .. inactive_alpha,
                },
                angle = gradient_degrees,
            },
            snap = {
                enabled = vars.theme.general.snap.enabled,
                respect_gaps = true,
            },
        }

        local decoration_conf = {
            rounding = 10,
            rounding_power = 2.0,
            active_opacity = 1.0,
            inactive_opacity = 0.85,
            screen_shader = "./shaders/" .. vars.theme.decoration.shader_file,
            blur = {
                enabled = vars.theme.decoration.blur.enabled,
                size = 3,
                passes = 1,
            },
            shadow = {
                enabled = vars.theme.decoration.shadow.enabled,
                range = 24,
                render_power = 4,
                color = "rgba(" .. col.map.background .. active_alpha,
            },
            glow = {
                enabled = vars.theme.decoration.glow.enabled,
                range = 5,
                render_power = 4,
                color = "rgba(" .. col.map.accent .. active_alpha,
            },
        }

        local group_conf = {
            drag_into_group = 1,
            merge_floated_into_tiled_on_groupbar = true,
            ["col.border_active"] = {
                colors = {
                    border.group_col1 .. active_alpha,
                    border.group_col2 .. active_alpha,
                },
                angle = gradient_degrees,
            },
            ["col.border_inactive"] = {
                colors = {
                    border.group_col1 .. inactive_alpha,
                    border.group_col2 .. inactive_alpha,
                },
                angle = gradient_degrees,
            },
            ["col.border_locked_active"] = {
                colors = {
                    border.group_locked_col1 .. active_alpha,
                    border.group_locked_col2 .. active_alpha,
                },
                angle = gradient_degrees,
            },
            ["col.border_locked_inactive"] = {
                colors = {
                    border.group_locked_col1 .. inactive_alpha,
                    border.group_locked_col2 .. inactive_alpha,
                },
                angle = gradient_degrees,
            },
            groupbar = {
                font_family = vars.theme.fonts.default,
                font_size = vars.theme.fonts.size,
                font_weight_active = "bold",
                font_weight_inactive = "normal",
                gradients = true,
                indicator_gap = 1,
                text_offset = 1,
                rounding = 2,
                rounding_power = 4,
                gradient_rounding = 10,
                gradient_rounding_power = 4,
                keep_upper_gap = false,
                blur = true,
                text_color = border.group_col2 .. active_alpha,
                text_color_inactive = border.group_col2 .. inactive_alpha,
                text_color_locked_active = border.group_locked_col2 .. active_alpha,
                text_color_locked_inactive = border.group_locked_col2 .. inactive_alpha,
                ["col.active"] = border.groupbar .. active_alpha,
                ["col.inactive"] = border.groupbar .. inactive_alpha,
                ["col.locked_active"] = border.groupbar_locked .. active_alpha,
                ["col.locked_inactive"] = border.groupbar_locked .. inactive_alpha,
            },
        }

        shell_overrides(shell, general_conf, decoration_conf, group_conf)

        hl.config({
            general = general_conf,
            decoration = decoration_conf,
            group = group_conf,
        })
    end,
}

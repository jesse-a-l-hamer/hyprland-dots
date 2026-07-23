return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local winman_mods = vars.binds.mods.windowman
        local cycling_mods = winman_mods.cycling
        local workspace_mod = " + " .. winman_mods.workspace
        local move_mod = " + " .. winman_mods.move
        local resize_mod = " + " .. winman_mods.resize
        local pypr = vars.plugins.pypr

        -- 10. Window management - Basic
        hl.bind(
            main_mod .. " + Q",
            hl.dsp.window.close(),
            { description = "Close window" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + Q",
            hl.dsp.window.kill(),
            { description = "Kill window" }
        )
        hl.bind(
            main_mod .. " + F",
            hl.dsp.window.fullscreen({ mode = "fullscreen" }),
            { description = "Fullscreen window" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + F",
            hl.dsp.window.fullscreen({ mode = "maximized" }),
            { description = "Maximize window" }
        )
        hl.bind(
            main_mod .. " + O",
            hl.dsp.layout("togglesplit"),
            { description = "Toggle split orientation" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + O",
            hl.dsp.window.pseudo(),
            { description = "Pseudo-tile window" }
        )
        hl.bind(
            main_mod .. " + P",
            hl.dsp.window.float(),
            { description = "Float window" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + P",
            hl.dsp.window.pin(),
            { description = "Pin window" }
        )
        hl.bind(
            main_mod .. " + G",
            hl.dsp.group.toggle(),
            { description = "Toggle group" }
        )
        hl.bind(
            main_mod .. " + CTRL + G",
            hl.dsp.group.lock_active(),
            { description = "Toggle group lock" }
        )
        hl.bind(
            main_mod .. " + CTRL + ALT + G",
            hl.dsp.window.deny_from_group(),
            { description = "Toggle deny from group" }
        )
        hl.bind(
            main_mod .. " + C",
            hl.dsp.exec_cmd(pypr .. " layout_center toggle"),
            { description = "Toggle center layout (Pyprland)" }
        )
        hl.bind(
            main_mod .. " + B",
            hl.dsp.exec_cmd(pypr .. " toggle_special minimized"),
            { description = "Toggle minimized" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + B",
            hl.dsp.workspace.toggle_special("minimized"),
            { description = "Show minimized" }
        )

        if vars.apps.shell == "noctalia" then
            hl.bind(
                main_mod .. " + ALT" .. " + tab",
                hl.dsp.exec_cmd("noctalia msg window-switcher"),
                { description = "Toggle window-switcher" }
            )
        end

        -- 11. Window management - Cycling
        hl.bind(
            main_mod .. " + tab",
            hl.dsp.window.cycle_next({ next = true, tiled = true, floating = true }),
            { description = "Cycle window next" }
        )
        hl.bind(
            main_mod .. " + " .. cycling_mods.prev .. " + tab",
            hl.dsp.window.cycle_next({ prev = true, tiled = true, floating = true }),
            { description = "Cycle window previous" }
        )
        hl.bind(
            main_mod .. " + " .. cycling_mods.swap .. " + tab",
            hl.dsp.window.swap({ next = true }, { description = "Swap window next" })
        )
        hl.bind(
            main_mod .. " + " .. cycling_mods.prev .. cycling_mods.swap .. " + tab",
            hl.dsp.window.swap(
                { prev = true },
                { description = "Swap window previous" }
            )
        )

        -- 12. Window management - Focus
        hl.bind(
            main_mod .. " + right",
            hl.dsp.focus({ direction = "r" }),
            { description = "Focus window right" }
        )
        hl.bind(
            main_mod .. " + left",
            hl.dsp.focus({ direction = "l" }),
            { description = "Focus window left" }
        )
        hl.bind(
            main_mod .. " + up",
            hl.dsp.focus({ direction = "u" }),
            { description = "Focus window up" }
        )
        hl.bind(
            main_mod .. " + down",
            hl.dsp.focus({ direction = "d" }),
            { description = "Focus window down" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + right",
            hl.dsp.group.next(),
            { description = "Focus group window right" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + left",
            hl.dsp.group.prev(),
            { description = "Focus group window left" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + down",
            hl.dsp.focus({ workspace = "e+1" }),
            { description = "Focus workspace next" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + up",
            hl.dsp.focus({ workspace = "e-1" }),
            { description = "Focus workspace previous" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 1",
            hl.dsp.focus({ workspace = "1" }),
            { description = "Focus workspace 1" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 2",
            hl.dsp.focus({ workspace = "2" }),
            { description = "Focus workspace 2" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 3",
            hl.dsp.focus({ workspace = "3" }),
            { description = "Focus workspace 3" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 4",
            hl.dsp.focus({ workspace = "4" }),
            { description = "Focus workspace 4" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 5",
            hl.dsp.focus({ workspace = "5" }),
            { description = "Focus workspace 5" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 6",
            hl.dsp.focus({ workspace = "6" }),
            { description = "Focus workspace 6" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 7",
            hl.dsp.focus({ workspace = "7" }),
            { description = "Focus workspace 7" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 8",
            hl.dsp.focus({ workspace = "8" }),
            { description = "Focus workspace 8" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 9",
            hl.dsp.focus({ workspace = "9" }),
            { description = "Focus workspace 9" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + 0",
            hl.dsp.focus({ workspace = "10" }),
            { description = "Focus workspace 10" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + mouse_down",
            hl.dsp.focus({ workspace = "e+1" }),
            { description = "focus workspace next" }
        )
        hl.bind(
            main_mod .. workspace_mod .. " + mouse_up",
            hl.dsp.focus({ workspace = "e-1" }),
            { description = "focus workspace previous" }
        )

        -- 13. Window management - Movement
        hl.bind(
            main_mod .. " + mouse:272",
            hl.dsp.window.drag(),
            { description = "Drag window" }
        )
        hl.bind(main_mod .. move_mod .. " + right", function()
            local w = hl.get_active_window()
            if w == nil then
                hl.exec_cmd("notify-send -e 'Unable to get active window'")
            elseif w.floating then
                hl.dispatch(hl.dsp.window.move({ x = 20, y = 0, relative = true }))
            else
                hl.dispatch(hl.dsp.window.move({ direction = "r" }))
            end
        end, { repeating = true, description = "Move window right" })
        hl.bind(main_mod .. move_mod .. " + left", function()
            local w = hl.get_active_window()
            if w == nil then
                hl.exec_cmd("notify-send -e 'Unable to get active window'")
            elseif w.floating then
                hl.dispatch(hl.dsp.window.move({ x = -20, y = 0, relative = true }))
            else
                hl.dispatch(hl.dsp.window.move({ direction = "l" }))
            end
        end, { repeating = true, description = "Move window left" })
        hl.bind(main_mod .. move_mod .. " + up", function()
            local w = hl.get_active_window()
            if w == nil then
                hl.exec_cmd("notify-send -e 'Unable to get active window'")
            elseif w.floating then
                hl.dispatch(hl.dsp.window.move({ x = 0, y = -20, relative = true }))
            else
                hl.dispatch(hl.dsp.window.move({ direction = "u" }))
            end
        end, { repeating = true, description = "Move window up" })
        hl.bind(main_mod .. move_mod .. " + down", function()
            local w = hl.get_active_window()
            if w == nil then
                hl.exec_cmd("notify-send -e 'Unable to get active window'")
            elseif w.floating then
                hl.dispatch(hl.dsp.window.move({ x = 0, y = 20, relative = true }))
            else
                hl.dispatch(hl.dsp.window.move({ direction = "d" }))
            end
        end, { repeating = true, description = "Move window down" })
        hl.bind(
            main_mod .. move_mod .. " + C",
            hl.dsp.window.center(),
            { description = "Center window" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + right",
            hl.dsp.group.move_window({ forward = true }),
            { description = "Move window in group right" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + left",
            hl.dsp.group.move_window({ forward = false }),
            { description = "Move window in group left" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + down",
            hl.dsp.window.move({ workspace = "e+1", follow = true }),
            { description = "Move to workspace next" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + up",
            hl.dsp.window.move({ workspace = "e-1", follow = true }),
            { description = "Move to workspace previous" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 1",
            hl.dsp.window.move({ workspace = "1", follow = true }),
            { description = "Move to workspace 1" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 2",
            hl.dsp.window.move({ workspace = "2", follow = true }),
            { description = "Move to workspace 2" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 3",
            hl.dsp.window.move({ workspace = "3", follow = true }),
            { description = "Move to workspace 3" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 4",
            hl.dsp.window.move({ workspace = "4", follow = true }),
            { description = "Move to workspace 4" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 5",
            hl.dsp.window.move({ workspace = "5", follow = true }),
            { description = "Move to workspace 5" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 6",
            hl.dsp.window.move({ workspace = "6", follow = true }),
            { description = "Move to workspace 6" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 7",
            hl.dsp.window.move({ workspace = "7", follow = true }),
            { description = "Move to workspace 7" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 8",
            hl.dsp.window.move({ workspace = "8", follow = true }),
            { description = "Move to workspace 8" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 9",
            hl.dsp.window.move({ workspace = "9", follow = true }),
            { description = "Move to workspace 9" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 0",
            hl.dsp.window.move({ workspace = "10", follow = true }),
            { description = "Move to workspace 10" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + mouse_down",
            hl.dsp.window.move({ workspace = "e+1", follow = true }),
            { description = "Move to workspace next" }
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + mouse_up",
            hl.dsp.window.move({ workspace = "e-1", follow = true }),
            { description = "Move to workspace previous" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + down",
            hl.dsp.window.move({ workspace = "e+1", follow = false }),
            { description = "Move to workspace next (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + up",
            hl.dsp.window.move({ workspace = "e-1", follow = false }),
            { description = "Move to workspace previous (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 1",
            hl.dsp.window.move({ workspace = "1", follow = false }),
            { description = "Move to workspace 1 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 2",
            hl.dsp.window.move({ workspace = "2", follow = false }),
            { description = "Move to workspace 2 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 3",
            hl.dsp.window.move({ workspace = "3", follow = false }),
            { description = "Move to workspace 3 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 4",
            hl.dsp.window.move({ workspace = "4", follow = false }),
            { description = "Move to workspace 4 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 5",
            hl.dsp.window.move({ workspace = "5", follow = false }),
            { description = "Move to workspace 5 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 6",
            hl.dsp.window.move({ workspace = "6", follow = false }),
            { description = "Move to workspace 6 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 7",
            hl.dsp.window.move({ workspace = "7", follow = false }),
            { description = "Move to workspace 7 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 8",
            hl.dsp.window.move({ workspace = "8", follow = false }),
            { description = "Move to workspace 8 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 9",
            hl.dsp.window.move({ workspace = "9", follow = false }),
            { description = "Move to workspace 9 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + 0",
            hl.dsp.window.move({ workspace = "10", follow = false }),
            { description = "Move to workspace 10 (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + mouse_down",
            hl.dsp.window.move({ workspace = "e+1", follow = false }),
            { description = "Move to workspace next (no follow)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + mouse_up",
            hl.dsp.window.move({ workspace = "e-1", follow = false }),
            { description = "Move to workspace previous (no follow)" }
        )

        -- 14. Window management - Resizing
        hl.bind(
            main_mod .. " + mouse:273",
            hl.dsp.window.resize(),
            { description = "Resize window" }
        )
        hl.bind(
            main_mod .. resize_mod .. " + right",
            hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
            { repeating = true, description = "Resize wider" }
        )
        hl.bind(
            main_mod .. resize_mod .. " + left",
            hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
            { repeating = true, description = "Resize narrower" }
        )
        hl.bind(
            main_mod .. resize_mod .. " + up",
            hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
            { repeating = true, description = "Resize shorter" }
        )
        hl.bind(
            main_mod .. resize_mod .. " + down",
            hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
            { repeating = true, description = "Resize taller" }
        )
    end,
}

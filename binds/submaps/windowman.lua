return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local winman_mods = vars.binds.mods.windowman
        local cycling_mods = winman_mods.cycling
        local workspace_mod = winman_mods.workspace
        local pypr = vars.plugins.pypr
        local catchall_notify = vars.binds.catchall_notify

        -- the whitespace is important here in the following variables
        local submap_hints = {
            wm_to_default = "   ESCAPE ->       default submap",
            subwm_to_wm = "     ESCAPE ->     windowman submap",
            subwm_to_default = "SHIFT+ESCAPE -> default submap",
        }

        local notifications = {
            wm = catchall_notify .. " 'submap = windowman'",
            wm_move = catchall_notify .. " 'submap = wm_move'",
            wm_resize = catchall_notify .. " 'submap = wm_resize'",
        }

        hl.bind(
            main_mod .. meh_mod .. " + W",
            hl.dsp.submap("windowman"),
            { description = "Activate `windowman` submap" }
        )
        hl.define_submap("windowman", function()
            -- cycling
            hl.bind(
                "tab",
                hl.dsp.exec_cmd(pypr .. " layout_center next"),
                { description = "Cycle next window" }
            )
            hl.bind(
                cycling_mods.prev .. " + tab",
                hl.dsp.exec_cmd(pypr .. " layout_center prev"),
                { description = "Cycle previous window" }
            )
            hl.bind(
                cycling_mods.swap .. " + tab",
                hl.dsp.window.swap(
                    { next = true },
                    { description = "Swap next window" }
                )
            )
            hl.bind(
                cycling_mods.prev .. cycling_mods.swap .. " + tab",
                hl.dsp.window.swap({ prev = true }),
                { description = "Swap previous window" }
            )

            -- focus
            hl.bind(
                "right",
                hl.dsp.focus({ direction = "r" }),
                { description = "Focus window right" }
            )
            hl.bind(
                "left",
                hl.dsp.focus({ direction = "l" }),
                { description = "Focus window left" }
            )
            hl.bind(
                "up",
                hl.dsp.focus({ direction = "u" }),
                { description = "Focus window up" }
            )
            hl.bind(
                "down",
                hl.dsp.focus({ direction = "d" }),
                { description = "Focus window down" }
            )

            hl.bind(
                workspace_mod .. " + right",
                hl.dsp.group.next(),
                { description = "Focus group window right" }
            )
            hl.bind(
                workspace_mod .. " + left",
                hl.dsp.group.prev(),
                { description = "Focus group window left" }
            )

            hl.bind(
                workspace_mod .. " + down",
                hl.dsp.focus({ workspace = "e+1" }),
                { description = "Focus workspace next" }
            )
            hl.bind(
                workspace_mod .. " + up",
                hl.dsp.focus({ workspace = "e-1" }),
                { description = "Focus workspace previous" }
            )
            hl.bind(
                workspace_mod .. " + 1",
                hl.dsp.focus({ workspace = "1" }),
                { description = "Focus workspace 1" }
            )
            hl.bind(
                workspace_mod .. " + 2",
                hl.dsp.focus({ workspace = "2" }),
                { description = "Focus workspace 2" }
            )
            hl.bind(
                workspace_mod .. " + 3",
                hl.dsp.focus({ workspace = "3" }),
                { description = "Focus workspace 3" }
            )
            hl.bind(
                workspace_mod .. " + 4",
                hl.dsp.focus({ workspace = "4" }),
                { description = "Focus workspace 4" }
            )
            hl.bind(
                workspace_mod .. " + 5",
                hl.dsp.focus({ workspace = "5" }),
                { description = "Focus workspace 5" }
            )
            hl.bind(
                workspace_mod .. " + 6",
                hl.dsp.focus({ workspace = "6" }),
                { description = "Focus workspace 6" }
            )
            hl.bind(
                workspace_mod .. " + 7",
                hl.dsp.focus({ workspace = "7" }),
                { description = "Focus workspace 7" }
            )
            hl.bind(
                workspace_mod .. " + 8",
                hl.dsp.focus({ workspace = "8" }),
                { description = "Focus workspace 8" }
            )
            hl.bind(
                workspace_mod .. " + 9",
                hl.dsp.focus({ workspace = "9" }),
                { description = "Focus workspace 9" }
            )
            hl.bind(
                workspace_mod .. " + 0",
                hl.dsp.focus({ workspace = "10" }),
                { description = "Focus workspace 10" }
            )
            hl.bind(
                workspace_mod .. " + mouse_down",
                hl.dsp.focus({ workspace = "e+1" }),
                { description = "Focus workspace next" }
            )
            hl.bind(
                workspace_mod .. " + mouse_up",
                hl.dsp.focus({ workspace = "e-1" }),
                { description = "Focus workspace previous" }
            )

            -- movement
            hl.bind(
                "M",
                hl.dsp.submap("wm_move"),
                { description = "Activate `windowman-move` submap" }
            )
            hl.define_submap("wm_move", function()
                hl.bind(
                    "mouse:272",
                    hl.dsp.window.drag(),
                    { description = "Drag window" }
                )

                hl.bind(
                    "right",
                    hl.dsp.window.move({ direction = "r" }),
                    { description = "Move window right" }
                )
                hl.bind(
                    "left",
                    hl.dsp.window.move({ direction = "l" }),
                    { description = "Move window left" }
                )
                hl.bind(
                    "up",
                    hl.dsp.window.move({ direction = "u" }),
                    { description = "Move window up" }
                )
                hl.bind(
                    "down",
                    hl.dsp.window.move({ direction = "d" }),
                    { description = "Move window down" }
                )

                hl.bind(
                    "right",
                    hl.dsp.window.move({ x = 20, y = 0, relative = true }),
                    { repeating = true, description = "Move window right" }
                )
                hl.bind(
                    "left",
                    hl.dsp.window.move({ x = -20, y = 0, relative = true }),
                    { repeating = true, description = "Move window left" }
                )
                hl.bind(
                    "up",
                    hl.dsp.window.move({ x = 0, y = -20, relative = true }),
                    { repeating = true, description = "Move window up" }
                )
                hl.bind(
                    "down",
                    hl.dsp.window.move({ x = 0, y = 20, relative = true }),
                    { repeating = true, description = "Move window down" }
                )
                hl.bind("C", hl.dsp.window.center(), { description = "Center window" })

                hl.bind(
                    workspace_mod .. " + right",
                    hl.dsp.group.move_window({ forward = true }),
                    { description = "Move group window right" }
                )
                hl.bind(
                    workspace_mod .. " + left",
                    hl.dsp.group.move_window({ forward = false }),
                    { description = "Move group window left" }
                )

                hl.bind(
                    workspace_mod .. " + down",
                    hl.dsp.window.move({ workspace = "e+1", follow = true }),
                    { description = "Move to workspace next" }
                )
                hl.bind(
                    workspace_mod .. " + up",
                    hl.dsp.window.move({ workspace = "e-1", follow = true }),
                    { description = "Move to workspace previous" }
                )
                hl.bind(
                    workspace_mod .. " + 1",
                    hl.dsp.window.move({ workspace = "1", follow = true }),
                    { description = "Move to workspace 1" }
                )
                hl.bind(
                    workspace_mod .. " + 2",
                    hl.dsp.window.move({ workspace = "2", follow = true }),
                    { description = "Move to workspace 2" }
                )
                hl.bind(
                    workspace_mod .. " + 3",
                    hl.dsp.window.move({ workspace = "3", follow = true }),
                    { description = "Move to workspace 3" }
                )
                hl.bind(
                    workspace_mod .. " + 4",
                    hl.dsp.window.move({ workspace = "4", follow = true }),
                    { description = "Move to workspace 4" }
                )
                hl.bind(
                    workspace_mod .. " + 5",
                    hl.dsp.window.move({ workspace = "5", follow = true }),
                    { description = "Move to workspace 5" }
                )
                hl.bind(
                    workspace_mod .. " + 6",
                    hl.dsp.window.move({ workspace = "6", follow = true }),
                    { description = "Move to workspace 6" }
                )
                hl.bind(
                    workspace_mod .. " + 7",
                    hl.dsp.window.move({ workspace = "7", follow = true }),
                    { description = "Move to workspace 7" }
                )
                hl.bind(
                    workspace_mod .. " + 8",
                    hl.dsp.window.move({ workspace = "8", follow = true }),
                    { description = "Move to workspace 8" }
                )
                hl.bind(
                    workspace_mod .. " + 9",
                    hl.dsp.window.move({ workspace = "9", follow = true }),
                    { description = "Move to workspace 9" }
                )
                hl.bind(
                    workspace_mod .. " + 0",
                    hl.dsp.window.move({ workspace = "10", follow = true }),
                    { description = "Move to workspace 10" }
                )
                hl.bind(
                    workspace_mod .. " + mouse_down",
                    hl.dsp.window.move({ workspace = "e+1", follow = true }),
                    { description = "Move to workspace next" }
                )
                hl.bind(
                    workspace_mod .. " + mouse_up",
                    hl.dsp.window.move({ workspace = "e-1", follow = true }),
                    { description = "Move to workspace previous" }
                )

                hl.bind(
                    workspace_mod .. " + SHIFT + down",
                    hl.dsp.window.move({ workspace = "e+1", follow = false }),
                    { description = "Move to workspace next (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + up",
                    hl.dsp.window.move({ workspace = "e-1", follow = false }),
                    { description = "Move to workspace previous (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 1",
                    hl.dsp.window.move({ workspace = "1", follow = false }),
                    { description = "Move to workspace 1 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 2",
                    hl.dsp.window.move({ workspace = "2", follow = false }),
                    { description = "Move to workspace 2 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 3",
                    hl.dsp.window.move({ workspace = "3", follow = false }),
                    { description = "Move to workspace 3 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 4",
                    hl.dsp.window.move({ workspace = "4", follow = false }),
                    { description = "Move to workspace 4 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 5",
                    hl.dsp.window.move({ workspace = "5", follow = false }),
                    { description = "Move to workspace 5 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 6",
                    hl.dsp.window.move({ workspace = "6", follow = false }),
                    { description = "Move to workspace 6 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 7",
                    hl.dsp.window.move({ workspace = "7", follow = false }),
                    { description = "Move to workspace 7 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 8",
                    hl.dsp.window.move({ workspace = "8", follow = false }),
                    { description = "Move to workspace 8 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 9",
                    hl.dsp.window.move({ workspace = "9", follow = false }),
                    { description = "Move to workspace 9 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 0",
                    hl.dsp.window.move({ workspace = "10", follow = false }),
                    { description = "Move to workspace 10 (no follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + mouse_down",
                    hl.dsp.window.move({ workspace = "e+1", follow = false }),
                    { description = "Move to workspace next follow)" }
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + mouse_up",
                    hl.dsp.window.move({ workspace = "e-1", follow = false }),
                    { description = "Move to workspace previous (no follow)" }
                )

                hl.bind(
                    "SHIFT + escape",
                    hl.dsp.submap("reset"),
                    { description = "Return to default submap" }
                )
                hl.bind(
                    "escape",
                    hl.dsp.submap("windowman"),
                    { description = "Return to `windowman` submap" }
                )
                hl.bind(
                    "catchall",
                    hl.dsp.exec_cmd(
                        notifications.wm_move
                            .. submap_hints.subwm_to_wm
                            .. "\n"
                            .. submap_hints.subwm_to_default
                    )
                )
            end)

            -- resizing
            hl.bind(
                "R",
                hl.dsp.submap("wm_resize"),
                { description = "Activate `windowman-resize` submap" }
            )
            hl.define_submap("wm_resize", function()
                hl.bind(
                    "mouse:273",
                    hl.dsp.window.resize(),
                    { description = "Drag to resize" }
                )

                hl.bind(
                    "right",
                    hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
                    { repeating = true, description = "Resize wider" }
                )
                hl.bind(
                    "left",
                    hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
                    { repeating = true, description = "Resize narrower" }
                )
                hl.bind(
                    "up",
                    hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
                    { repeating = true, description = "Resize shorter" }
                )
                hl.bind(
                    "down",
                    hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
                    { repeating = true, description = "Resize taller" }
                )
                hl.bind(
                    "SHIFT + escape",
                    hl.dsp.submap("reset"),
                    { description = "Return to default submap" }
                )
                hl.bind(
                    "escape",
                    hl.dsp.submap("windowman"),
                    { description = "Return to `windowman` submap" }
                )
                hl.bind(
                    "catchall",
                    hl.dsp.exec_cmd(
                        notifications.wm_resize
                            .. submap_hints.subwm_to_wm
                            .. "\n"
                            .. submap_hints.subwm_to_default
                    )
                )
            end)

            hl.bind(
                "escape",
                hl.dsp.submap("reset"),
                { description = "Return to default submap" }
            )
            hl.bind(
                "catchall",
                hl.dsp.exec_cmd(notifications.wm .. submap_hints.wm_to_default)
            )
        end)
    end,
}

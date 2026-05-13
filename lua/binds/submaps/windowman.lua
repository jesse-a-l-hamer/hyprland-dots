return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = vars.binds.mods.meh
        local winman_mods = vars.binds.mods.windowman
        local cycling_mods = winman_mods.cycling
        local workspace_mod = winman_mods.workspace
        local move_mod = winman_mods.move
        local resize_mod = winman_mods.resize
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

        hl.bind(main_mod .. meh_mod + " + W", hl.dsp.submap("windowman"))
        hl.define_submap("windowman", function()
            -- cycling
            hl.bind("tab", hl.dsp.exec_cmd(pypr .. " layout_center next"))
            hl.bind(
                cycling_mods.prev .. " + tab",
                hl.dsp.exec_cmd(pypr .. " layout_center prev")
            )
            hl.bind(cycling_mods.swap .. " + tab", hl.dsp.window.swap({ "next" }))
            hl.bind(
                cycling_mods.prev .. cycling_mods.swap .. " + tab",
                hl.dsp.window.swap({ "prev" })
            )

            -- focus
            hl.bind("right", hl.dsp.focus({ "r" }))
            hl.bind("left", hl.dsp.focus({ "l" }))
            hl.bind("up", hl.dsp.focus({ "u" }))
            hl.bind("down", hl.dsp.focus({ "d" }))

            hl.bind(workspace_mod .. " + right", hl.dsp.group.next())
            hl.bind(workspace_mod .. " + left", hl.dsp.group.prev())

            hl.bind(workspace_mod .. " + down", hl.dsp.focus({ workspace = "e+1" }))
            hl.bind(workspace_mod .. " + up", hl.dsp.focus({ workspace = "e-1" }))
            hl.bind(workspace_mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
            hl.bind(workspace_mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
            hl.bind(workspace_mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
            hl.bind(workspace_mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
            hl.bind(workspace_mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
            hl.bind(workspace_mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
            hl.bind(workspace_mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
            hl.bind(workspace_mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
            hl.bind(workspace_mod .. " + 9", hl.dsp.focus({ workspace = "9" }))
            hl.bind(workspace_mod .. " + 0", hl.dsp.focus({ workspace = "10" }))
            hl.bind(
                workspace_mod .. " + mouse_down",
                hl.dsp.focus({ workspace = "e+1" })
            )
            hl.bind(workspace_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

            -- movement
            hl.bind("M", hl.dsp.submap("wm_move"))
            hl.define_submap("wm_move", function()
                hl.bind("mouse:272", hl.dsp.window.drag())

                hl.bind("right", hl.dsp.window.move({ "r" }))
                hl.bind("left", hl.dsp.window.move({ "l" }))
                hl.bind("up", hl.dsp.window.move({ "u" }))
                hl.bind("down", hl.dsp.window.move({ "d" }))

                hl.bind(
                    "right",
                    hl.dsp.window.move({ 20, 0, relative = true }),
                    { repeating = true }
                )
                hl.bind(
                    "left",
                    hl.dsp.window.move({ -20, 0, relative = true }),
                    { repeating = true }
                )
                hl.bind(
                    "up",
                    hl.dsp.window.move({ 0, -20, relative = true }),
                    { repeating = true }
                )
                hl.bind(
                    "down",
                    hl.dsp.window.move({ 0, 20, relative = true }),
                    { repeating = true }
                )
                hl.bind("C", hl.dsp.window.center())

                hl.bind(
                    workspace_mod .. " + right",
                    hl.dsp.group.move_window({ forward = true })
                )
                hl.bind(
                    workspace_mod .. " + left",
                    hl.dsp.group.move_window({ forward = false })
                )

                hl.bind(
                    workspace_mod .. " + down",
                    hl.dsp.window.move({ workspace = "e+1", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + up",
                    hl.dsp.window.move({ workspace = "e-1", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 1",
                    hl.dsp.window.move({ workspace = "1", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 2",
                    hl.dsp.window.move({ workspace = "2", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 3",
                    hl.dsp.window.move({ workspace = "3", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 4",
                    hl.dsp.window.move({ workspace = "4", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 5",
                    hl.dsp.window.move({ workspace = "5", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 6",
                    hl.dsp.window.move({ workspace = "6", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 7",
                    hl.dsp.window.move({ workspace = "7", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 8",
                    hl.dsp.window.move({ workspace = "8", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 9",
                    hl.dsp.window.move({ workspace = "9", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + 0",
                    hl.dsp.window.move({ workspace = "10", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + mouse_down",
                    hl.dsp.window.move({ workspace = "e+1", follow = true })
                )
                hl.bind(
                    workspace_mod .. " + mouse_up",
                    hl.dsp.window.move({ workspace = "e-1", follow = true })
                )

                hl.bind(
                    workspace_mod .. " + SHIFT + down",
                    hl.dsp.window.move({ workspace = "e+1", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + up",
                    hl.dsp.window.move({ workspace = "e-1", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 1",
                    hl.dsp.window.move({ workspace = "1", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 2",
                    hl.dsp.window.move({ workspace = "2", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 3",
                    hl.dsp.window.move({ workspace = "3", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 4",
                    hl.dsp.window.move({ workspace = "4", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 5",
                    hl.dsp.window.move({ workspace = "5", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 6",
                    hl.dsp.window.move({ workspace = "6", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 7",
                    hl.dsp.window.move({ workspace = "7", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 8",
                    hl.dsp.window.move({ workspace = "8", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 9",
                    hl.dsp.window.move({ workspace = "9", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + 0",
                    hl.dsp.window.move({ workspace = "10", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + mouse_down",
                    hl.dsp.window.move({ workspace = "e+1", follow = false })
                )
                hl.bind(
                    workspace_mod .. " + SHIFT + mouse_up",
                    hl.dsp.window.move({ workspace = "e-1", follow = false })
                )

                hl.bind("SHIFT + escape", hl.dsp.submap("reset"))
                hl.bind("escape", hl.dsp.submap("windowman"))
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
            hl.bind("R", hl.dsp.submap("wm_resize"))
            hl.define_submap("wm_resize", function()
                hl.bind("mouse:273", hl.dsp.window.resize())

                hl.bind("right", hl.dsp.window.resize({ 10, 0, relative = true }))
                hl.bind("left", hl.dsp.window.resize({ -10, 0, relative = true }))
                hl.bind("up", hl.dsp.window.resize({ 0, -10, relative = true }))
                hl.bind("down", hl.dsp.window.resize({ 0, 10, relative = true }))
                hl.bind("SHIFT + escape", hl.dsp.submap("reset"))
                hl.bind("escape", hl.dsp.submap("windowman"))
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

            hl.bind("escape", hl.dsp.submap("reset"))
            hl.bind(
                "catchall",
                hl.dsp.exec_cmd(notifications.wm .. submap_hints.wm_to_default)
            )
        end)
    end,
}

return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local winman_mods = vars.binds.mods.windowman
        local cycling_mods = winman_mods.cycling
        local workspace_mod = " + " .. winman_mods.workspace
        local move_mod = " + " .. winman_mods.move
        local resize_mod = " + " .. winman_mods.resize
        local pypr = vars.plugins.pypr

        -- basic
        hl.bind(main_mod .. " + Q", hl.dsp.window.close())
        hl.bind(main_mod .. meh_mod .. " + Q", hl.dsp.window.kill())
        hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
        hl.bind(
            main_mod .. meh_mod .. " + F",
            hl.dsp.window.fullscreen({ mode = "maximized" })
        )
        hl.bind(main_mod .. " + O", hl.dsp.layout("togglesplit"))
        hl.bind(main_mod .. meh_mod .. " + O", hl.dsp.window.pseudo())
        hl.bind(main_mod .. " + P", hl.dsp.window.float())
        hl.bind(main_mod .. meh_mod .. " + P", hl.dsp.window.pin())
        hl.bind(main_mod .. " + G", hl.dsp.group.toggle())
        hl.bind(main_mod .. " + CTRL + G", hl.dsp.group.lock_active())
        hl.bind(main_mod .. " + CTRL + ALT + G", hl.dsp.window.deny_from_group())
        hl.bind(main_mod .. " + C", hl.dsp.exec_cmd(pypr .. " layout_center toggle"))
        hl.bind(
            main_mod .. " + B",
            hl.dsp.exec_cmd(pypr .. " toggle_special minimized")
        )
        hl.bind(
            main_mod .. meh_mod .. " + B",
            hl.dsp.workspace.toggle_special("minimized")
        )

        -- cycling
        -- hl.bind(main_mod .. " + tab", hl.dsp.exec_cmd(pypr .. " layout_center next"))
        -- hl.bind(
        --     main_mod .. " + " .. cycling_mods.prev .. " + tab",
        --     hl.dsp.exec_cmd(pypr .. " layout_center prev")
        -- )
        hl.bind(
            main_mod .. " + tab",
            hl.dsp.window.cycle_next({ next = true, tiled = true, floating = true })
        )
        if vars.apps.shell == "noctalia" then
            hl.bind(
                main_mod .. " + ALT" .. " + tab",
                hl.dsp.exec_cmd("noctalia msg window-switcher")
            )
        end
        hl.bind(
            main_mod .. " + " .. cycling_mods.prev .. " + tab",
            hl.dsp.window.cycle_next({ prev = true, tiled = true, floating = true })
        )
        hl.bind(
            main_mod .. " + " .. cycling_mods.swap .. " + tab",
            hl.dsp.window.swap({ next = true })
        )
        hl.bind(
            main_mod .. " + " .. cycling_mods.prev .. cycling_mods.swap .. " + tab",
            hl.dsp.window.swap({ prev = true })
        )

        -- focus
        hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "r" }))
        hl.bind(main_mod .. " + left", hl.dsp.focus({ direction = "l" }))
        hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "u" }))
        hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "d" }))

        hl.bind(main_mod .. workspace_mod .. " + right", hl.dsp.group.next())
        hl.bind(main_mod .. workspace_mod .. " + left", hl.dsp.group.prev())

        hl.bind(
            main_mod .. workspace_mod .. " + down",
            hl.dsp.focus({ workspace = "e+1" })
        )
        hl.bind(
            main_mod .. workspace_mod .. " + up",
            hl.dsp.focus({ workspace = "e-1" })
        )
        hl.bind(main_mod .. workspace_mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
        hl.bind(main_mod .. workspace_mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
        hl.bind(main_mod .. workspace_mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
        hl.bind(main_mod .. workspace_mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
        hl.bind(main_mod .. workspace_mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
        hl.bind(main_mod .. workspace_mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
        hl.bind(main_mod .. workspace_mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
        hl.bind(main_mod .. workspace_mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
        hl.bind(main_mod .. workspace_mod .. " + 9", hl.dsp.focus({ workspace = "9" }))
        hl.bind(main_mod .. workspace_mod .. " + 0", hl.dsp.focus({ workspace = "10" }))
        hl.bind(
            main_mod .. workspace_mod .. " + mouse_down",
            hl.dsp.focus({ workspace = "e+1" })
        )
        hl.bind(
            main_mod .. workspace_mod .. " + mouse_up",
            hl.dsp.focus({ workspace = "e-1" })
        )

        -- movement
        hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag())

        hl.bind(
            main_mod .. move_mod .. " + right",
            hl.dsp.window.move({ direction = "r" })
        )
        hl.bind(
            main_mod .. move_mod .. " + left",
            hl.dsp.window.move({ direction = "l" })
        )
        hl.bind(
            main_mod .. move_mod .. " + up",
            hl.dsp.window.move({ direction = "u" })
        )
        hl.bind(
            main_mod .. move_mod .. " + down",
            hl.dsp.window.move({ direction = "d" })
        )

        hl.bind(
            main_mod .. move_mod .. " + right",
            hl.dsp.window.move({ x = 20, y = 0, relative = true }),
            { repeating = true }
        )
        hl.bind(
            main_mod .. move_mod .. " + left",
            hl.dsp.window.move({ x = -20, y = 0, relative = true }),
            { repeating = true }
        )
        hl.bind(
            main_mod .. move_mod .. " + up",
            hl.dsp.window.move({ x = 0, y = -20, relative = true }),
            { repeating = true }
        )
        hl.bind(
            main_mod .. move_mod .. " + down",
            hl.dsp.window.move({ x = 0, y = 20, relative = true }),
            { repeating = true }
        )
        hl.bind(main_mod .. move_mod .. " + C", hl.dsp.window.center())

        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + right",
            hl.dsp.group.move_window({ forward = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + left",
            hl.dsp.group.move_window({ forward = false })
        )

        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + down",
            hl.dsp.window.move({ workspace = "e+1", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + up",
            hl.dsp.window.move({ workspace = "e-1", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 1",
            hl.dsp.window.move({ workspace = "1", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 2",
            hl.dsp.window.move({ workspace = "2", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 3",
            hl.dsp.window.move({ workspace = "3", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 4",
            hl.dsp.window.move({ workspace = "4", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 5",
            hl.dsp.window.move({ workspace = "5", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 6",
            hl.dsp.window.move({ workspace = "6", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 7",
            hl.dsp.window.move({ workspace = "7", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 8",
            hl.dsp.window.move({ workspace = "8", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 9",
            hl.dsp.window.move({ workspace = "9", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + 0",
            hl.dsp.window.move({ workspace = "10", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + mouse_down",
            hl.dsp.window.move({ workspace = "e+1", follow = true })
        )
        hl.bind(
            main_mod .. move_mod .. workspace_mod .. " + mouse_up",
            hl.dsp.window.move({ workspace = "e-1", follow = true })
        )

        hl.bind(
            main_mod .. meh_mod .. " + down",
            hl.dsp.window.move({ workspace = "e+1", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + up",
            hl.dsp.window.move({ workspace = "e-1", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 1",
            hl.dsp.window.move({ workspace = "1", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 2",
            hl.dsp.window.move({ workspace = "2", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 3",
            hl.dsp.window.move({ workspace = "3", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 4",
            hl.dsp.window.move({ workspace = "4", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 5",
            hl.dsp.window.move({ workspace = "5", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 6",
            hl.dsp.window.move({ workspace = "6", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 7",
            hl.dsp.window.move({ workspace = "7", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 8",
            hl.dsp.window.move({ workspace = "8", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 9",
            hl.dsp.window.move({ workspace = "9", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + 0",
            hl.dsp.window.move({ workspace = "10", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + mouse_down",
            hl.dsp.window.move({ workspace = "e+1", follow = false })
        )
        hl.bind(
            main_mod .. meh_mod .. " + mouse_up",
            hl.dsp.window.move({ workspace = "e-1", follow = false })
        )

        -- resizing
        hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize())

        hl.bind(
            main_mod .. resize_mod .. " + right",
            hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
            { repeating = true }
        )
        hl.bind(
            main_mod .. resize_mod .. " + left",
            hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
            { repeating = true }
        )
        hl.bind(
            main_mod .. resize_mod .. " + up",
            hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
            { repeating = true }
        )
        hl.bind(
            main_mod .. resize_mod .. " + down",
            hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
            { repeating = true }
        )
    end,
}

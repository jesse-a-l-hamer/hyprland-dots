return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local notif_mods = vars.binds.mods.notifications
        local notif_key = " + N"
        local scripts = vars.paths.scripts

        hl.bind(main_mod .. notif_key, hl.dsp.exec_cmd("dunstctl set-paused toggle"))
        hl.bind(
            main_mod .. notif_mods.show .. notif_key,
            hl.dsp.exec_cmd("dunstctl history-pop")
        )
        hl.bind(
            main_mod .. notif_mods.show .. notif_mods.all .. notif_key,
            hl.dsp.exec_cmd("python " .. scripts .. "binds/notifications/show-all.py")
        )
        hl.bind(
            main_mod .. notif_mods.close .. notif_key,
            hl.dsp.exec_cmd("dunstctl close")
        )
        hl.bind(
            main_mod .. notif_mods.show .. notif_mods.all .. notif_key,
            hl.dsp.exec_cmd("dunstctl close-all")
        )
        hl.bind(
            main_mod .. notif_mods.delete .. notif_key,
            hl.dsp.exec_cmd(
                "python " .. scripts .. "binds/notifications/delete-single.py"
            )
        )
        hl.bind(
            main_mod .. notif_mods.delete .. notif_mods.all .. notif_key,
            hl.dsp.exec_cmd("dunstctl history-clear")
        )
    end,
}

return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + "  ..vars.binds.mods.meh
        local apps = vars.apps
        local pypr = vars.plugins.pypr

        hl.bind(main_mod .. " + period", hl.dsp.exec_cmd(pypr .. " toggle term"))
        hl.bind(main_mod .. " + slash", hl.dsp.exec_cmd(pypr .. " toggle file_manager"))
        hl.bind(
            main_mod .. meh_mod .. " + slash",
            hl.dsp.exec_cmd("app2unit-term -- sudo " .. apps.file_manager)
        )
        hl.bind(main_mod .. " + M", hl.dsp.exec_cmd(pypr .. " toggle system_monitor"))
        hl.bind(
            main_mod .. meh_mod .. " + M",
            hl.dsp.exec_cmd("app2unit-term -- sudo " .. apps.system_monitor)
        )
        hl.bind(main_mod .. " + U", hl.dsp.exec_cmd(pypr .. " toggle unit_monitor"))
        hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(pypr .. " toggle email"))
        hl.bind(
            main_mod .. meh_mod .. " + E",
            hl.dsp.exec_cmd(pypr .. " toggle calendar")
        )
        hl.bind(main_mod .. " + S", hl.dsp.exec_cmd(pypr .. " toggle sms"))
        hl.bind(
            main_mod .. " + V",
            hl.dsp.exec_cmd("app2unit-term -- " .. apps.mediaplayer_local)
        )
        hl.bind(
            main_mod .. meh_mod .. " + V",
            hl.dsp.exec_cmd("app2unit-term -- " .. apps.mediaplayer_remote)
        )
        hl.bind(main_mod .. " + comma", hl.dsp.exec_cmd(pypr .. " toggle browser"))
    end,
}

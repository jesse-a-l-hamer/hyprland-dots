local shell_overrides = {
    default = function(main_mod, meh_mod) end,
    noctalia = function(main_mod, meh_mod)
        local ipc = "noctalia msg "

        hl.bind(
            main_mod .. " + space",
            hl.dsp.exec_cmd(ipc .. "panel-toggle control-center")
        )
        hl.bind(
            main_mod .. meh_mod .. " + space",
            hl.dsp.exec_cmd(ipc .. "settings-toggle")
        )
    end,
}
return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local apps = vars.apps
        local pypr = vars.plugins.pypr
        local shell = vars.apps.shell

        hl.bind(main_mod .. " + period", hl.dsp.exec_cmd(pypr .. " toggle term"))
        hl.bind(main_mod .. " + slash", hl.dsp.exec_cmd(pypr .. " toggle file_manager"))
        hl.bind(
            main_mod .. meh_mod .. " + slash",
            hl.dsp.exec_cmd("app2unit-term -- sudo " .. apps.file_manager)
        )
        hl.bind(main_mod .. " + J", hl.dsp.exec_cmd(pypr .. " toggle system_monitor"))
        hl.bind(
            main_mod .. meh_mod .. " + J",
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
            main_mod .. " + M",
            hl.dsp.exec_cmd("app2unit-term -- " .. apps.mediaplayer_local)
        )
        hl.bind(
            main_mod .. meh_mod .. " + M",
            hl.dsp.exec_cmd("app2unit-term -- " .. apps.mediaplayer_remote)
        )
        hl.bind(main_mod .. " + comma", hl.dsp.exec_cmd(pypr .. " toggle browser"))
        hl.bind(
            main_mod .. " + V",
            hl.dsp.exec_cmd("app2unit -- /home/jalhamer/.local/bin/launch-keepassxc.sh")
        )

        if require("utils").contains_key(shell, shell_overrides) then
            shell_overrides[shell](main_mod, meh_mod)
        end
    end,
}

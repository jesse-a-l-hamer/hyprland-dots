return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local timecheck = vars.paths.scripts .. "binds/apps/timecheck"
        local shell = vars.apps.shell

        if shell == "noctalia" then
            local ipc = "noctalia msg "
            hl.bind(
                main_mod .. " + space",
                hl.dsp.exec_cmd(ipc .. "panel-toggle control-center")
            )
            hl.bind(
                main_mod .. meh_mod .. " + space",
                hl.dsp.exec_cmd(ipc .. "settings-toggle")
            )
            hl.bind(
                main_mod .. " + K",
                hl.dsp.exec_cmd(
                    ipc .. "panel-toggle blackbartblues/keymap:panel"
                )
            )
            hl.bind(
                main_mod .. " + T",
                hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/timer:panel")
            )
            hl.bind(
                main_mod .. meh_mod .. " + T",
                hl.dsp.exec_cmd(ipc .. "panel-toggle nightwatch75/todo:panel")
            )
        else
            hl.bind(main_mod .. " + T", hl.dsp.exec_cmd(timecheck .. " toggle"))
            hl.bind(
                main_mod .. meh_mod .. " + T",
                hl.dsp.exec_cmd(timecheck .. " delete")
            )
        end
    end,
}

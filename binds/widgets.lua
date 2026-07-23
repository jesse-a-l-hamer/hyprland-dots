return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local timecheck = vars.paths.scripts .. "binds/apps/timecheck"
        local shell = vars.apps.shell

        if shell == "noctalia" then
            local ipc = "noctalia msg "
            -- 2. Widgets
            hl.bind(
                main_mod .. " + space",
                hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"),
                { description = "Noctalia control-center" }
            )
            hl.bind(
                main_mod .. meh_mod .. " + space",
                hl.dsp.exec_cmd(ipc .. "settings-toggle"),
                { description = "Noctalia settings" }
            )
            hl.bind(
                main_mod .. " + K",
                hl.dsp.exec_cmd(ipc .. "panel-toggle blackbartblues/keymap:panel"),
                { description = "Noctalia keymap" }
            )
            hl.bind(
                main_mod .. " + T",
                hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/timer:panel"),
                { description = "Noctalia timer" }
            )
            hl.bind(
                main_mod .. meh_mod .. " + T",
                hl.dsp.exec_cmd(ipc .. "panel-toggle nightwatch75/todo:panel"),
                { description = "Noctalia todo" }
            )
        else
            -- 2. Widgets
            hl.bind(main_mod .. " + T", hl.dsp.exec_cmd(timecheck .. " toggle"))
            hl.bind(
                main_mod .. meh_mod .. " + T",
                hl.dsp.exec_cmd(timecheck .. " delete"),
                { description = "Custom timer" }
            )
        end
    end,
}

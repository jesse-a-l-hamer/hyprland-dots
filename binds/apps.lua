return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local apps = vars.apps
        local pypr = vars.plugins.pypr

        -- 1. Apps
        hl.bind(
            main_mod .. " + period",
            hl.dsp.exec_cmd(pypr .. " toggle term"),
            { description = "Terminal" }
        )
        hl.bind(
            main_mod .. " + slash",
            hl.dsp.exec_cmd(pypr .. " toggle file_manager"),
            { description = "File manager" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + slash",
            hl.dsp.exec_cmd("app2unit-term -- sudo " .. apps.file_manager),
            { description = "File manager (sudo)" }
        )
        hl.bind(
            main_mod .. " + J",
            hl.dsp.exec_cmd(pypr .. " toggle system_monitor"),
            { description = "System monitor" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + J",
            hl.dsp.exec_cmd("app2unit-term -- sudo " .. apps.system_monitor),
            { description = "System monitor (sudo)" }
        )
        hl.bind(
            main_mod .. " + U",
            hl.dsp.exec_cmd(pypr .. " toggle unit_monitor"),
            { description = "Unit monitor" }
        )
        hl.bind(
            main_mod .. " + E",
            hl.dsp.exec_cmd(pypr .. " toggle email"),
            { description = "Email" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + E",
            hl.dsp.exec_cmd(pypr .. " toggle calendar"),
            { description = "Calendar" }
        )
        hl.bind(
            main_mod .. " + S",
            hl.dsp.exec_cmd(pypr .. " toggle sms"),
            { description = "SMS" }
        )
        hl.bind(
            main_mod .. " + M",
            hl.dsp.exec_cmd("app2unit-term -- " .. apps.mediaplayer_local),
            { description = "Media player (local)" }
        )
        hl.bind(
            main_mod .. meh_mod .. " + M",
            hl.dsp.exec_cmd("app2unit-term -- " .. apps.mediaplayer_remote),
            { description = "Media player (remote)" }
        )
        hl.bind(
            main_mod .. " + comma",
            hl.dsp.exec_cmd(pypr .. " toggle browser"),
            { description = "Browser" }
        )
        hl.bind(
            main_mod .. " + V",
            hl.dsp.exec_cmd("app2unit -- /home/jalhamer/.local/bin/launch-keepassxc.sh"),
            { description = "Vault" }
        )
    end,
}

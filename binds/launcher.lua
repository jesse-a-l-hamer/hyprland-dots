local combo_cmd = {
    default = "rofi -show combi -modes combi -combi-modes 'window,drun,run'",
    hyprlauncher = "hyprlauncher",
}
local apps_cmd = {
    default = "rofi -show drun",
    hyprlauncher = "hyprlauncher",
}
local window_cmd = {
    default = "rofi -show window",
}
local run_cmd = {
    default = "rofi -show run",
}

return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local launcher_mod = " + " .. vars.binds.mods.launcher
        local launcher = vars.apps.launcher

        hl.bind(
            main_mod .. launcher_mod .. " + return",
            hl.dsp.exec_cmd(combo_cmd[launcher] or combo_cmd["default"])
        )
        hl.bind(main_mod .. launcher_mod .. " + A", hl.dsp.exec_cmd(apps_cmd[launcher] or apps_cmd["default"]))
        hl.bind(
            main_mod .. launcher_mod .. " + W",
            hl.dsp.exec_cmd(window_cmd[launcher] or run_cmd["default"])
        )
        hl.bind(main_mod .. launcher_mod .. " + R", hl.dsp.exec_cmd(run_cmd[launcher] or run_cmd["default"]))
    end,
}

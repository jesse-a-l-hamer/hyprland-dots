local combo_cmd = {
    default = "rofi -show combi -modes combi -combi-modes 'window,drun,run'",
    hyprlauncher = "hyprlauncher",
    noctalia = "noctalia msg panel-toggle launcher",
}
local apps_cmd = {
    default = "rofi -show drun",
    hyprlauncher = "hyprlauncher",
    noctalia = "noctalia msg panel-toggle launcher",
}
local window_cmd = {
    default = "rofi -show window",
    noctalia = "noctalia msg panel-toggle launcher /win",
}
local run_cmd = {
    default = "rofi -show run",
    noctalia = "noctalia msg panel-toggle launcher",
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
        hl.bind(
            main_mod .. launcher_mod .. " + A",
            hl.dsp.exec_cmd(apps_cmd[launcher] or apps_cmd["default"])
        )
        hl.bind(
            main_mod .. launcher_mod .. " + W",
            hl.dsp.exec_cmd(window_cmd[launcher] or run_cmd["default"])
        )
        hl.bind(
            main_mod .. launcher_mod .. " + R",
            hl.dsp.exec_cmd(run_cmd[launcher] or run_cmd["default"])
        )
    end,
}

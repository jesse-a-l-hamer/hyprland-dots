local combo_cmd = {
    rofi = "rofi -show combi -modes combi -combi-modes 'window,drun,run'",
}
local apps_cmd = {
    rofi = "rofi -show drun",
}
local window_cmd = {
    rofi = "rofi -show window",
}
local run_cmd = {
    rofi = "rofi -show run",
}

return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local launcher_mod = " + " .. vars.binds.mods.launcher
        local launcher = vars.apps.launcher

        hl.bind(
            main_mod .. launcher_mod .. " + return",
            hl.dsp.exec_cmd(combo_cmd[launcher])
        )
        hl.bind(main_mod .. launcher_mod .. " + A", hl.dsp.exec_cmd(apps_cmd[launcher]))
        hl.bind(
            main_mod .. launcher_mod .. " + W",
            hl.dsp.exec_cmd(window_cmd[launcher])
        )
        hl.bind(main_mod .. launcher_mod .. " + R", hl.dsp.exec_cmd(run_cmd[launcher]))
    end,
}

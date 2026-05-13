return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        local timecheck = vars.paths.scripts .. "binds/apps/timecheck"

        hl.bind(main_mod .. " + T", hl.dsp.exec_cmd(timecheck .. " toggle"))
        hl.bind(main_mod .. meh_mod .. " + T", hl.dsp.exec_cmd(timecheck .. " delete"))
    end,
}

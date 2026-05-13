return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        hl.bind(
            main_mod .. meh_mod .. " + escape",
            hl.dsp.submap("reset"),
            { submap_universal = true }
        )

        require("binds.system").setup(vars)
        require("binds.brightness").setup(vars)
        require("binds.media").setup(vars)
        require("binds.notifications").setup(vars)
        require("binds.volume").setup(vars)
        require("binds.windowman").setup(vars)
        require("binds.apps").setup(vars)
        require("binds.launcher").setup(vars)
        require("binds.timecheck").setup(vars)
        require("binds.pyprland").setup(vars)

        require("binds.submaps.windowman").setup(vars)
    end,
}

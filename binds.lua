return {
    setup = function(vars)
        local main_mod = vars.binds.mods.main
        local meh_mod = vars.binds.mods.meh
        hl.bind(
            main_mod .. meh_mod .. " + escape",
            hl.dsp.submap("reset"),
            { submap_universal = true }
        )

        require("./binds/system.lua").setup(vars)
        require("./binds/brightness.lua").setup(vars)
        require("./binds/media.lua").setup(vars)
        require("./binds/notifications.lua").setup(vars)
        require("./binds/volume.lua").setup(vars)
        require("./binds/windowman.lua").setup(vars)
        require("./binds/apps.lua").setup(vars)
        require("./binds/launcher.lua").setup(vars)
        require("./binds/timecheck.lua").setup(vars)
        require("./binds/pyprland.lua").setup(vars)

        require("./binds/submaps/windowman.lua").setup(vars)
    end,
}

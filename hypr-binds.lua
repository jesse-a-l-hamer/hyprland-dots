return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local meh_mod = " + " .. vars.binds.mods.meh
        hl.bind(
            main_mod .. meh_mod .. " + escape",
            hl.dsp.submap("reset"),
            { submap_universal = true, description = "Universal submap reset" }
        )

        require("binds.apps").setup()
        require("binds.brightness").setup()
        require("binds.launcher").setup()
        require("binds.media").setup()
        require("binds.notifications").setup()
        require("binds.pyprland").setup()
        require("binds.system").setup()
        require("binds.volume").setup()
        require("binds.widgets").setup()
        require("binds.windowman").setup()

        require("binds.submaps.windowman").setup()
    end,
}

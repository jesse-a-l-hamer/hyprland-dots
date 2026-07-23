return {
    setup = function()
        local vars = require("hypr-vars")
        local main_mod = vars.binds.mods.main
        local pypr = vars.plugins.pypr

        -- 9. Pyprland
        hl.bind(
            main_mod .. " + A",
            hl.dsp.exec_cmd(pypr .. " expose"),
            { description = "Show all windows" }
        )
        hl.bind(
            main_mod .. " + Z",
            hl.dsp.exec_cmd(pypr .. " zoom ++0.5"),
            { description = "Zoom in" }
        )
        hl.bind(
            main_mod .. " + CTRL + Z",
            hl.dsp.exec_cmd(pypr .. " zoom"),
            { description = "Reset zoom" }
        )
    end,
}
